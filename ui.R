#
# This is the user-interface definition of the Shiny web application for Oesophageal cancer research.
# 
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Oesophageal Cancer dependence on Smoking, Alcohol and Age"),
   
  # Sidebar with checkboxes
  sidebarLayout(
    sidebarPanel(
      h3("Ages to be included in the plot:"),
      checkboxInput("inc25", "25-34", value=TRUE),
      checkboxInput("inc35", "35-44", value=TRUE),
      checkboxInput("inc45", "45-54", value=TRUE),
      checkboxInput("inc55", "55-64", value=TRUE),
      checkboxInput("inc65", "65-74", value=TRUE),
      checkboxInput("inc75", "75+", value=TRUE),
      h3("x-axes dimension is Alcohol (selected) / Tobacco (unselected):"),
      checkboxInput("alctob", "Alcohol", value=TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Plot", br(), plotOutput("myPlot")),
                  tabPanel("Instructions", br(), 
                           h1("Instructions for the use of the Oesophageal Cancer Application"),
                           p("This application allows for the examination of data on the effects of 
                             alcohol consumption and smoking on the prevalence of oesophageal cancer
                             for different age groups"),
                           h3("Use"),
                           p("Toggle the checkboxes in order to include certain age groups. By default all ages are included"),
                           p("Toggle the Alcohol/Tobacco checkbox to examine the dependence on these variables"),
                           p("The graph shows the dependence on the chosen variable and colour coded secondary variable"),
                           p("A regression model is shown for each variable combination")
                           )
      )
    )
  )

))
