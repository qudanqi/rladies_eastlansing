source("chapters_source.R")
library(shinydashboard)
library(shiny)
library(leaflet)

## ui.R ##

## UI CONFIG

## Header
header <- dashboardHeader(title = "R-Ladies")

# Sidebar content
sidebar <- dashboardSidebar(
	sidebarMenu(
		menuItem(text = "R-Ladies", tabName = "R-Ladies", icon = icon("dashboard")),
		menuItem(text = "By Region", tabName = "region", icon = icon("dashboard")),
		menuItem(text = "About", tabName = "about", icon = icon("heart"))
	)
)

## Body content
body <-   
	dashboardBody(
		tabItems(
			
			# Front Page
			
			# First sidebar tab - R-Ladies
			tabItem(tabName = "R-Ladies",
							selected = TRUE, 
							
							fluidRow(
								absolutePanel(style = "z-index: 2000", fixed = TRUE, draggable = TRUE,
															top = 10, left = "auto", right = 20, width = "250px",
															div(
																tags$a(target="_blank", 
																			 href = "http://www.rladies.org", 
																			 tags$img(src="R-LadiesGlobal_RBG_online_LogoWithText.png", 
																			 				 height = "30px", id = "logo") 
																)
															)
								),
								# A static valueBox
								valueBox(dim(rladies_groups)[1], "R-Ladies groups on meetup.com", 
												 icon("meetup", lib = "font-awesome"), width = 3),
								valueBox(length(unique(rladies_groups$country)), "R-Ladies Countries", 
												 icon = icon("map-o"), width = 3),
								valueBox(length(rladies_groups$city), "R-Ladies Cities", 
												 icon = icon("map-marker"), color = "purple", width = 3),
								valueBox(sum(rladies_groups$members), "R-Ladies members on meetup.com", 
												 icon = icon("users"), width = 3)
							),
							leafletOutput('map', height = 700)
			),
			
			# Second sidebar tab - Region
			tabItem(tabName = "region",
							navbarPage(title = 'R-Ladies',
												 
												 tabPanel(title = 'USA',
												 				 fluidRow(
												 				 	column(width = 4,
												 				 				 # A static valueBox
												 				 				 valueBox(nrow(groups_usa), "R-Ladies groups in the US", 
												 				 				 				 icon = icon("glyphicon-blackboard"), width = 18
												 				 				 ),
												 				 				 box("Created at", width = 18, tableOutput("created_usa"))
												 				 	),
												 				 	column(width = 6,
												 				 				 leafletOutput('map_usa')
												 				 	)
												 				 )
												 ),
												 tabPanel(title = 'Canada',
												 				 fluidRow(
												 				 	column(
												 				 		width = 4,
												 				 		# A static valueBox
												 				 		valueBox(nrow(groups_canada), "R-Ladies groups in Canada", 
												 				 						 icon = icon("glyphicon-blackboard"), width = 18
												 				 		),
												 				 		box("Created at", width = 18, tableOutput("created_canada")
												 				 		)
												 				 	),
												 				 	column(
												 				 		width = 8,
												 				 		leafletOutput('map_canada')
												 				 	)
												 				 )
												 ),
												 tabPanel(title = 'Latin America',
												 				 fluidRow(
												 				 	column(
												 				 		width = 4,
												 				 		# A static valueBox
												 				 		valueBox(nrow(groups_latam), "R-Ladies groups in Latin America", 
												 				 						 icon = icon("glyphicon-blackboard"), width = 18
												 				 		),
												 				 		box("Created at", width = 18, tableOutput("created_latam")
												 				 		)
												 				 	),
												 				 	column(
												 				 		width = 8,
												 				 		leafletOutput('map_latam')
												 				 	)
												 				 )
												 ),
												 tabPanel(title = 'Europe',
												 				 fluidRow(
												 				 	column(
												 				 		width = 4,
												 				 		# A static valueBox
												 				 		valueBox(nrow(groups_europe), "R-Ladies groups in Europe",
												 				 						 icon = icon("glyphicon-blackboard"), width = 18
												 				 		),
												 				 		box("Created at", width = 18, tableOutput("created_europe")
												 				 		)
												 				 	),
												 				 	column(
												 				 		width = 8,
												 				 		leafletOutput('map_europe')
												 				 	)
												 				 )
												 ),
												 tabPanel(title = 'Africa',
												 				 fluidRow(
												 				 	column(
												 				 		width = 4,
												 				 		# A static valueBox
												 				 		valueBox(nrow(groups_africa), "R-Ladies groups in Africa", 
												 				 						 icon = icon("glyphicon-blackboard"), width = 18
												 				 		),
												 				 		box("Created at", width = 18, tableOutput("created_africa")
												 				 		)
												 				 	),
												 				 	column(
												 				 		width = 8,
												 				 		leafletOutput('map_africa'))
												 				 )
												 ),
												 tabPanel(title = 'Asia',
												 				 fluidRow(
												 				 	column(
												 				 		width = 4,
												 				 		# A static valueBox
												 				 		valueBox(nrow(groups_asia), "R-Ladies groups in Asia",
												 				 						 icon = icon("glyphicon-blackboard"), width = 18
												 				 		),
												 				 		box("Created at", width = 18, tableOutput("created_asia")
												 				 		)
												 				 	),
												 				 	column(
												 				 		width = 8,
												 				 		leafletOutput('map_asia'))
												 				 )
												 ),
												 tabPanel(title = 'Australia',
												 				 fluidRow(
												 				 	column(
												 				 		width = 4,
												 				 		# A static valueBox
												 				 		valueBox(nrow(groups_australia), "R-Ladies groups in Australia",
												 				 						 icon = icon("glyphicon-blackboard"), width = 18
												 				 		),
												 				 		box("Created at", width = 18, tableOutput("created_australia")
												 				 		)
												 				 	),
												 				 	column(
												 				 		width = 8,
												 				 		leafletOutput('map_australia'))
												 				 )
												 )
							)
			),
			tabItem(tabName = "about",
							
							
							fluidPage(
								h1(strong("About:")),
								p("This app was developed by ",
									a("R-Ladies.", href = "http://www.rladies.org"), 
									"You can find the source code",
									a("here.", href = "https://github.com/rladies/rshinylady")),
								
								img(src = "R-LadiesGlobal_RBG_online_LogoWithText.png", height = 300, width = 300)
								
							)
			)))




ui <- dashboardPage(skin = "purple", header, sidebar, body)

icons <- awesomeIcons(icon = "whatever",
											iconColor = "black",
											library = "ion",
											markerColor = "purple")

server <- function(input, output) { 
	
	output$map <- renderLeaflet({
		leaflet(data = rladies_groups) %>% 
			addTiles() %>%
			addAwesomeMarkers(~lon, ~lat, label = ~as.character(name), icon = icons)
	})
	output$created_usa <- renderTable(created_usa, striped = TRUE, hover = TRUE)
	output$map_usa <- renderLeaflet({
		leaflet(groups_usa) %>% 
			addTiles() %>%
			addMarkers(~lon, ~lat, label = ~as.character(name)) 
	})
	output$created_canada <- renderTable(created_canada, striped = TRUE, hover = TRUE)
	output$map_canada <- renderLeaflet({
		leaflet(groups_canada) %>% 
			addTiles() %>%
			addMarkers(~lon, ~lat, label = ~as.character(name)) 
	})
	output$created_latam <- renderTable(created_latam, striped = TRUE, hover = TRUE)
	output$map_latam <- renderLeaflet({
		leaflet(groups_latam) %>% 
			addTiles() %>%
			addMarkers(~lon, ~lat, label = ~as.character(name)) 
	})
	output$created_europe <- renderTable(created_europe, striped = TRUE, hover = TRUE)
	output$map_europe <- renderLeaflet({
		leaflet(groups_europe) %>%
			addTiles() %>%
			addMarkers(~lon, ~lat, label = ~as.character(name))
	})
	output$created_africa <- renderTable(created_africa, striped = TRUE, hover = TRUE)
	output$map_africa <- renderLeaflet({
		leaflet(groups_africa) %>% 
			addTiles() %>%
			addMarkers(~lon, ~lat, label = ~as.character(name)) 
	})
	output$created_asia <- renderTable(created_asia, striped = TRUE, hover = TRUE)
	output$map_asia <- renderLeaflet({
		leaflet(groups_asia) %>% 
			addTiles() %>%
			addMarkers(~lon, ~lat, label = ~as.character(name)) 
	})
	output$created_australia <- renderTable(created_australia, striped = TRUE, hover = TRUE)
	output$map_australia <- renderLeaflet({
		leaflet(groups_australia) %>% 
			addTiles() %>%
			addMarkers(~lon, ~lat, label = ~as.character(name)) 
	})
	
	
}


shinyApp(ui, server)

