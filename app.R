library(RCurl)
library(shiny)
library(readr)
MyData <- read.csv('https://raw.githubusercontent.com/JingSu1/Callingcodes/main/callingcodes.csv')
ui <- fluidPage(
  titlePanel("Calling Codes Lookup Tool"), 
  sidebarLayout(
    sidebarPanel(
      selectInput("region", "Country, Territory or Service:", choices = MyData$Region),
      hr(),
      helpText("This shiny app includes 280 records of calling codes from different countries, territories, and services. 
               Selecting any places that you are interested in the selection bar on the left, and you can find the corresponding calling code in the mainpanel on the right.")
    ),
    mainPanel(
      h1(textOutput("textOutput")), 
      
      
      h5('The source of data is https://en.wikipedia.org/wiki/List_of_country_calling_codes')
    )
  )
)

server <- function(input, output, session) {
  output$textOutput <- renderText({
    paste0('The calling code of ', input$region, ' is: +', MyData[which(MyData$Region == input$region), 2])
  })
}

shinyApp(ui, server)
