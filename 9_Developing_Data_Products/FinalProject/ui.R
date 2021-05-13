#Air Quality Shiny App User Interface
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Predict Ozone (ppb)"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput("numTemp","What is the Temperature (F) of the day?",min=55,max=100,step=0.5,value=75),
            numericInput("numWind","What is the Wind Speed (mph) of the day?",min=2,max=21,step=0.5,value=9),
            numericInput("numSolar","What is the Solar Radiation of the day?",min=7,max=334,step=0.5,value=184),
            checkboxInput("inc_solar","Include/Exclude Solar Radiation in Model 2",value=TRUE),
            checkboxInput("inc_wind","Include/Exclude Wind Speed (mph) in Model 2",value=TRUE),
            checkboxInput("show_Model1","Show/Hide Model 1: Temp Only",value=TRUE),
            checkboxInput("show_Model2","Show/Hide Model 2: Included Variables",value=TRUE),
            submitButton("Submit")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("scatPlot"),
            h3("Predicted Ozone (ppb) from Model 1 (Temperature Only):"),
            textOutput("pred1"),
            h3("Predicted Ozone (ppb) from Model 2 (Temperature + Selected Variables):"),
            textOutput("pred2")
        )
    )
))
