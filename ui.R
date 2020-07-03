#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    
    titlePanel("Data Summary Table"),
    
    sidebarLayout(
        
        # Sidebar panel for inputs
        sidebarPanel(
            
            textInput(inputId = "caption",
                      label = "Caption Name:",
                      value = "Data Summary"),
            
            selectInput(inputId = "dataset",
                        label = "Choose a dataset:",
                        choices = c("Rock", "Pressure", "Cars", "US Arrests")),
            
            sliderInput(inputId = "obs",
                         label = "Number of observations to view:",
                         value = 0, min = 0 , max = 50),
            
            h6("Total Observations:"),
            h6(textOutput("total"))
        ),
        
        # Main panel for displaying outputs 
        mainPanel(
            
            
            h3(textOutput("caption", container = span)),
            
            # Output: Verbatim text for data summary ----
            verbatimTextOutput("summary"),
            
            # Output: HTML table with requested number of observations ----
            tableOutput("view")
            
            
        )
    )
))