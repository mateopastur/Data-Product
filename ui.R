
library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict weight from height"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderheight","What is the height in inches?", 10, 100,value = 50)
        ),
        mainPanel(
            plotOutput("plot"),
            h3("Predicted weight in lbs from lineal model:"),
            textOutput("pred"),
        )
    )
))
