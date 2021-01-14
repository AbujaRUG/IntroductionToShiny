

library(tidyverse)
library(shiny)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("First Abuja R User Group Shiny App"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "bins",
                        label = "Change the number of bins:",
                        min = 1,
                        max = 30,
                        value = 15)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput(outputId = "distPlot")
        )
    )
)





# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        #x    <- faithful[, 2]
        #bins <- seq(min(x), max(x), length.out =input$bins + 1)

        # draw the histogram with the specified number of bins
        #hist(x, breaks = bins, col = 'darkgray', border = 'white')
        
        ggplot(faithful, aes(x = waiting))+
            geom_histogram(fill = "steelblue", bins = input$bins )+
            labs(title = "A histogram of Waiting in Faithful")
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
