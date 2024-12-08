# app.R
# This is a sample shiny app that allow users to access the information through a url with qr code retrevial encryption
# Author Paul Banda
# Devops Engineer

library(shiny)
library(qrcode)

# Generate a QR code with some app information and URL
app_info <- list(
  name = "My Simple QR App",
  description = "An app that showcases QR code retrieval.",
  url = "https://example.com"
)

# Convert the information to a JSON-like string for the QR code
qr_data <- paste0(
  "Name: ", app_info$name, "\n",
  "Description: ", app_info$description, "\n",
  "URL: ", app_info$url
)

ui <- fluidPage(
  titlePanel("QR Code App"),
  sidebarLayout(
    sidebarPanel(
      h3("Scan the QR Code"),
      p("Use your phone or a QR scanner to retrieve the information.")
    ),
    mainPanel(
      plotOutput("qrCode"),
      h3("App Information"),
      verbatimTextOutput("appInfo")
    )
  )
)

server <- function(input, output) {
  output$qrCode <- renderPlot({
    qrcode::qrcode_gen(qr_data)
  })
  
  output$appInfo <- renderText({
    paste("App Name: ", app_info$name, "\n",
          "Description: ", app_info$description, "\n",
          "URL: ", app_info$url)
  })
}

shinyApp(ui = ui, server = server)
