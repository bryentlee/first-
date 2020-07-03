
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    datasetInput <- reactive({
        switch(input$dataset,
               "Rock" = rock,
               "Pressure" = pressure,
               "Cars" = cars,
               "US Arrests" = USArrests)
    })
    
    output$caption <- renderText({
        input$caption
    })
    
    output$summary <- renderPrint({
        dataset <- datasetInput()
        summary(dataset)
    })
    
    output$view <- renderTable({
        head(datasetInput(), n = input$obs)
    })
    
    output$total <- renderPrint({
        dataset <- datasetInput()
        nrow(dataset)
    })
})


