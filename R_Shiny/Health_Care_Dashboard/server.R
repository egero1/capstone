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
library(flexdashboard)


#readQuery <-function(file) paste(readLines(file), collapse="\n")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        observeEvent(input$std_selecthosptype, {
                output$renderstandards <- renderUI({
                        selectInput("std_selectstandards", label = h3("Select Standard"), choices = get_chapter_names(input$std_selecthosptype), selected = 1, multiple = FALSE)
                })
        })
        
        observeEvent(input$std_getstandards, {
                hosp_type <- trimws(input$std_selecthosptype)
                standards <- input$std_selectstandards
                chapter <- trimws(strsplit(standards," - ")[[1]][1])
                standard <- trimws(strsplit(standards," - ")[[1]][2])

                # Create the gauge
                risk <- get_safer_risk(hosp_type, standard)
                
                output$min_risk_gauge <- flexdashboard::renderGauge({
                        gauge(risk[,1], 
                              min = 0, 
                              max = 10, 
                              label = paste("Minimum SAFER Risk"),
                              gaugeSectors(
                                      success = c(0, 4), 
                                      warning = c(5, 7), 
                                      danger = c(8, 10)
                              ))
                })
                
                output$avg_risk_gauge <- flexdashboard::renderGauge({
                        gauge(risk[,2], 
                              min = 0, 
                              max = 10, 
                              label = paste("Average SAFER Risk"),
                              gaugeSectors(
                                      success = c(0, 4), 
                                      warning = c(5, 7), 
                                      danger = c(8, 10)
                              ))
                })
                
                output$max_risk_gauge <- flexdashboard::renderGauge({
                        gauge(risk[,3], 
                              min = 0, 
                              max = 10, 
                              label = paste("Maximum SAFER Risk"),
                              gaugeSectors(
                                      success = c(0, 4), 
                                      warning = c(5, 7), 
                                      danger = c(8, 10)
                              ))
                })

                plot_data <- get_standards(hosp_type, standard)
                
                # Create the plot
                output$probPlot <- renderPlot({
                        ggplot(plot_data, aes(x = standard_label2, y = probabilities, group = standard_label2, fill = probabilities)) +
                                geom_bar(stat="identity") + 
                                scale_fill_gradient2(midpoint = 0.5, low = "green", mid = "orange", high = "red") +
                                scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
                                labs(x = "Standard",
                                     y = "Probability",
                                     title = "Probability by Occurrence",
                                     fill = "Probabilities") +
                                theme(axis.text.x = element_text(angle = 45, hjust = 1)) 
                })
                
                
            
        })
        
        observeEvent(input$hosp_getstandards, {
                standards <- input$hosp_standards
                chapter <- trimws(strsplit(standards," - ")[[1]][1])
                standard <- trimws(strsplit(standards," - ")[[1]][2])
                data <- get_hospital_by_standard(standard)
                print(standard)
                output$hosp_table <- renderDataTable({data})
        })
})
