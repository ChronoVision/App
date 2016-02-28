library(shiny)
library(caret)

fit <- lm(dist~speed, data=cars)

# Define server logic required to draw plot
shinyServer(function(input, output) {
      output$Plot <- renderPlot({
            plot(cars$speed,cars$dist, xlab="speed (mph)", 
                 ylab="stopping distance (ft)",
                 col= "skyblue",
                 pch=20,
                 main="This graph predicts the stopping distance of a car, given its speed")
            points(input$speed, 
                   predict(fit, data.frame(speed=input$speed)), 
                   col="darkred",
                   pch=20,
                   lwd=3
                   )
            text(input$speed, 
                 predict(fit, data.frame(speed=input$speed)), 
                 labels=round(predict(fit, data.frame(speed=input$speed)), 
                              digits=1), 
                 col="darkred",
                 cex=1.5,
                 pos=3)
      })
      output$text <- renderText({predict(fit, data.frame(speed=input$speed))})
      
      
})