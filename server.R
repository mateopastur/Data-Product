library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    model <- lm(weight ~ height, data = women)
    modelpred <- reactive({
        heightInput <- input$sliderheight
        predict(model, newdata = data.frame(height = heightInput))
    })
    ({    
        output$plot <- renderPlot({
        g <- ggplot(women,aes(height,weight), xlab = "Height[inches]",
             ylab = "Weight[lbs]") + 
            geom_point(aes(size=2))+
            geom_smooth(method="lm")
        g
        })
        
        output$pred <- renderText({
            modelpred()
        })
        
    })
    })