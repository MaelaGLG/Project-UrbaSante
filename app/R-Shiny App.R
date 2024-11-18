#----------------------------------- INFO -------------------------------------#
# Author : Alfonso AWADALLA 
# Date	: March 2024
# Descr	: Some Data Processing + Shiny App
#------------------------------------------------------------------------------#


#----------------------------- Import Libraries -------------------------------#

packages <- c("sp", "sf", "data.table", "dplyr", "readxl", "shiny", "shinythemes",
              "leaflet", "RColorBrewer", "rmapshaper", "rstudioapi")

# Check each package, install if missing
for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
  library(pkg, character.only = TRUE)
}


#---------------------- Import Data & Quick processing ------------------------#

# Set current directory to current folder of the script
current_folder = dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(current_folder)

# Define file paths for Shapefiles
path_data = "../data/4- Final Data/final_indicators.rds"
path_indic_corresp = "../data/Linking Tables/liaison - indicateurs et descriptions/Indicateurs Correspondance.xlsx"
path_regions = "../data/Shapefiles/path/to/regions-20180101.shp" # modify according to you
path_departements = "../data/Shapefiles/path/to/departements-20180101.shp" # modify according to you
path_communes = "../data/Shapefiles/path/to/communes-20220101.shp" # modify according to you
path_iris = "../data/Shapefiles/path/to/CONTOURS-IRIS.shp" # modify according to you

# Load the data
data = as.data.table(read_rds(path_data))
indicateurs_determinants = as.data.table(read_xlsx(path_indic_corresp))

# Read and process regions shp
regions = st_read(path_regions)
regions_insee = as.data.table(regions)

# Read and process departements shp
departements_insee = st_read(path_departements)
departements_insee = st_transform(departements_insee, st_crs(regions))
departements_insee = as.data.table(departements_insee)

# Read and process communes shp
communes_insee = st_read(path_communes)
communes_insee = st_transform(communes_insee, st_crs(regions))
communes_insee = as.data.table(communes_insee)

# Read and process iris shp
iris_insee = st_read(path_iris)
iris_insee = st_transform(iris_insee, st_crs(regions))
iris_insee = as.data.table(iris_insee)

# Assuming `data` is your main data.table
# Subset data for each 'niveau'
iris_data = data[niveau == "Iris"]
communes_data = data[niveau == "Communes"]
departements_data = data[niveau == "Departements"]
regions_data = data[niveau == "Regions"]

# Perform any necessary merging (if applicable)
iris_data = merge.data.table(
  iris_data,
  iris_insee[, .(CODE_IRIS, geometry)],
  by.x = "code_insee",  
  by.y = "CODE_IRIS",   
  all.x = TRUE)

communes_data = merge.data.table(
  communes_data,
  communes_insee[, .(insee, geometry)],
  by.x = "code_insee",  
  by.y = "insee",   
  all.x = TRUE)

departements_data = merge.data.table(
  departements_data,
  departements_insee[, .(code_insee, geometry)],
  by = "code_insee",
  all.x = TRUE)

regions_data = merge.data.table(
  regions_data,
  regions_insee[, .(code_insee, geometry)],
  by = "code_insee",
  all.x = TRUE)

# Merge rows back into final indicator
data = rbindlist(list(
  iris_data,
  communes_data,
  departements_data,
  regions_data
), use.names = TRUE, fill = TRUE)

# Convert into spatial object
indicateur_final = as.data.table(data)
indicateur_final = st_as_sf(indicateur_final)

################################################################################
#                               Shiny APP                                     #
################################################################################

ui <- fluidPage(
  titlePanel("Visualisation des déterminants de santé des territoires"),
  theme = shinytheme("journal"),
  sidebarLayout(
    sidebarPanel(
      selectInput("determinant", "Choisir un déterminant", choices = unique(indicateurs_determinants$Determinant), selected = "Déterminant n°1 : Qualité de l'air"),
      selectInput("indicateur", "Choisir un indicateur:", choices = NULL),
      selectInput("echelle", "Choisir une échelle:", choices = NULL),
      uiOutput("dynamicScale"),
      selectizeInput('localisation', "Choisir localisation:", choices = NULL),
      actionButton("btnInfo", "Informations")
    ),
    mainPanel(
      # Main panel content here
      leafletOutput("map")
    )
  )
)


server <- function(input, output, session) {
  # Reactive expression for filtered indicators by determinant
  filteredIndicators <- reactive({
    indicateurs_determinants[Determinant == input$determinant]})
  
  # Update available indicators based on chosen determinant
  observe({
    items <- filteredIndicators()
    updateSelectInput(session, "indicateur", choices = unique(items$Indicateur))})
  
  # Reactive expression for echelle filtering
  filteredEchelle <- reactive({
    # Ensure that input$indicateur is not empty and exists as a column in indicateur_final
    req(input$indicateur, !is.na(input$indicateur), input$indicateur %in% names(indicateur_final))
    # Proceed with filtering and selection
    indicateur_final %>%
      filter(!is.na(.data[[input$indicateur]])) %>%
      select(code_insee, niveau, nom_dep, nom, geometry, .data[[input$indicateur]])%>%
      mutate(across(.cols = all_of(input$indicateur), .fns = ~round(., digits = 2)))
  })
  
  # Update available echelles based on chosen indicateur
  observe({
    echelle <- filteredEchelle()
    if (nrow(echelle) > 0) {
      updateSelectInput(session, "echelle", choices = unique(echelle$niveau))}})
  
  # Dynamic input based on scale (iris & communes)
  output$dynamicScale <- renderUI({
    if(input$echelle %in% c("Communes", "Iris")) {
      selectInput("department", "Choisir département à visualiser:", choices = unique(filteredEchelle()$nom_dep))}})
  
  # Determine if the current scale requires a department filter
  # Make requiresDept a reactive expression
  requiresDept <- reactive({
    input$echelle %in% c("Communes", "Iris")
  })
  
  
  # Filter data based on current inputs, considering whether department is relevant
  filteredData <- reactive({
    baseData <- filteredEchelle() %>% filter(niveau == input$echelle)
    if (requiresDept() && !is.null(input$department) && input$department != "") {
      baseData %>% filter(nom_dep == input$department)
    } else {
      baseData
    }
  })
  
  # Update available locations based on indicateur and echelle
  observe({
    lieux <- filteredData()%>%
      filter(niveau == input$echelle)
    updateSelectizeInput(session, "localisation", choices = unique(lieux$nom), selected=NA, server = TRUE)})
  
  
  #Map render
  output$map <- renderLeaflet({
    
    # Data from reactive
    data_map <- filteredData()
    
    # Check if the data is in a valid state for rendering
    if (is.null(data_map) || nrow(data_map) == 0 || is.list(data_map[[input$indicateur]])) {
      return(NULL)  # Do not render the map if data is not ready
    }
    
    # Prepare color palette
    color_pal <- colorNumeric(palette = "viridis", domain = data_map[[input$indicateur]])
    
    # Render the map
    map <- leaflet(data = data_map) %>%
      addTiles() %>%
      addProviderTiles(providers$CartoDB.Positron) %>%
      setView(lng = 2.2137, lat = 46.2276, zoom = 5) %>%
      addPolygons(
        fillColor = ~color_pal(as.numeric(data_map[[input$indicateur]])),
        color = "#BDBDC3", weight = 1, opacity = 1,
        fillOpacity = 0.7, smoothFactor = 0.5,
        highlightOptions = highlightOptions(weight = 2, color = "#666", fillOpacity = 0.7, bringToFront = TRUE),
        label = ~as.character(nom),
        popup = ~paste("Zone: ", nom, "<br>", "Value: ", as.numeric(data_map[[input$indicateur]])),
        group = "polygons"
      ) %>%
      addLegend(pal = color_pal, values = ~as.numeric(data_map[[input$indicateur]]), title = "Légende", position = "bottomright")
    
    map
  })
  
  # Update map zoom on department chosen if iris or communes
  observeEvent(input$department, {
    # Ensure a location has been selected; otherwise, do nothing
    if(is.null(input$department) || input$department == "") {
      return()
    }
    
    # Assuming filteredData() properly filters the spatial data
    selectedDepartment <- filteredData()
    
    # Check if selectedDepartment has more than one row
    if(nrow(selectedDepartment) > 1) {
      bbox <- st_bbox(selectedDepartment)
      min_long <- as.numeric(bbox["xmin"])
      max_long <- as.numeric(bbox["xmax"])
      min_lat <- as.numeric(bbox["ymin"])
      max_lat <- as.numeric(bbox["ymax"])
      
      # You might want to use these variables inside fitBounds
      leafletProxy("map", session) %>%
        fitBounds(lng1 = min_long, lat1 = min_lat, lng2 = max_long, lat2 = max_lat)
    }
  })
  
  
  # Update map zoom on localisation chosen
  observeEvent(input$localisation, {
    # Ensure a location has been selected; otherwise, do nothing
    if(is.null(input$localisation) || input$localisation == "") {
      return()
    }
    
    # Assuming filteredData() properly filters the spatial data
    selectedLocation <- filteredData() %>%
      filter(nom == input$localisation)
    
    # Check if selectedDepartment has more than one row
    if(nrow(selectedLocation) > 0) {
      bbox <- st_bbox(selectedLocation)
      min_long <- as.numeric(bbox["xmin"])
      max_long <- as.numeric(bbox["xmax"])
      min_lat <- as.numeric(bbox["ymin"])
      max_lat <- as.numeric(bbox["ymax"])
      
      # You might want to use these variables inside fitBounds
      leafletProxy("map", session) %>%
        fitBounds(lng1 = min_long, lat1 = min_lat, lng2 = max_long, lat2 = max_lat)
    }
  })
  
  
  observeEvent(input$btnInfo, {
    # Filter the dataset for the selected indicateur
    selectedIndicateurInfo <- filteredIndicators() %>%
      filter(Indicateur == input$indicateur) %>%
      select(Description) %>%
      .[[1]] # Assuming 'Description' is the column with the information text
    # Use showModal to display the information
    if (!is.null(selectedIndicateurInfo) && selectedIndicateurInfo != "") {
      showModal(modalDialog(
        title = "Informations sur l'indicateur",
        selectedIndicateurInfo, # This displays the description text
        easyClose = TRUE,
        footer = modalButton("Fermer")
      ))
    } else {
      showModal(modalDialog(
        title = "Information non disponible",
        "Aucune information disponible pour cet indicateur.",
        easyClose = TRUE,
        footer = modalButton("Fermer")
      ))
    }
  })
  
}

shinyApp(ui, server)
