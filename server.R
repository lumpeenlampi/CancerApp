#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$myPlot <- renderPlot({
    
    data(esoph)
    esoph2 <- cbind(esoph, nprev=esoph$ncases/(esoph$ncases + esoph$ncontrols))

    ages <- c("25-34", "35-44", "45-54", "55-64", "65-74", "75+")
    selages <- ages[c(input$inc25, input$inc35, input$inc45, input$inc55, input$inc65, input$inc75)]
    
    esoph3 <- esoph2[esoph2$agegp %in% selages,]
    
    gat <- ggplot(data=esoph3, aes(y=nprev, x=as.numeric(alcgp), color=tobgp)) + geom_point() + geom_smooth(method="lm")
    gat <- gat + xlab("Alcohol consumption") + ylab("Prevalence") + labs(color="Tobacco")
    gta <- ggplot(data=esoph3, aes(y=nprev, x=as.numeric(tobgp), color=alcgp)) + geom_point() + geom_smooth(method="lm")
    gta <- gta + xlab("Tobacco use") + ylab("Prevalence") + labs(color="Alcohol")
    
    ifelse(input$alctob, g <- gat, g <- gta)
    g
    
  })
  
})
