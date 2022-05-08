server <- function(input, output, session) {
  output$textOutput <- renderText({
    paste0('The calling code of ', input$region, ' is: +', MyData[which(MyData$Region == input$region), 2])
  })
}

shinyApp(ui, server)