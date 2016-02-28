library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
      
      # Application title
      titlePanel("Cars: speed and stopping distance"),
      
      # Sidebar 
      sidebarLayout(
            sidebarPanel(
                  p("This App allows you to predict the car stopping distance, based on the speed at which is was driving. It makes a prediction based on a linear model trained on 50 observations."),
                  p("Below, you can input a car speed, ranging from 0 to 25 miles per hour. On the right panel, you will see the predicted stopping distance"),
                  sliderInput("speed",
                              "Car speed (mph)",
                              min = 1,
                              max = 25,
                              value = 30)
            ),
            
             # Show a plot of the generated distribution
            mainPanel(
                  plotOutput("Plot"),
                  h4("the predicted stopping distance is (ft):"),
                  textOutput("text")
            )
      )
))