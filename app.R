library(shiny)

ui <- fluidPage(
    titlePanel("Simple App"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("slider", "Select a value:", min = 1, max = 100, value = 50)
        ),
        mainPanel(
            textOutput("outputText")
        )
    )
)

server <- function(input, output, session) {
    output$outputText <- renderText({
        paste("You selected:", input$slider)
    })
}

shinyApp(ui, server)
