#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinythemes)

ui <- dashboardPage(
        dashboardHeader(title = "Diz-E Doctors Findings Finder",
                        titleWidth = 450),
        dashboardSidebar(width = 125,
                         sidebarMenu(
                                 menuItem("Standards", tabName = "standard", icon = icon("dashboard")),
                                 menuItem("Hospital", tabName = "hospital", icon = icon("bed"))
                         )
        ),
        dashboardBody(
                tabItems(
                        tabItem(tabName = "standard",
                                fluidRow(
                                        selectInput("std_selecthosptype", label = h3("Select Hospital Type"), choices = get_hospital_types(), selected = 'Acute Care, Psychiatric Distinct Part Unit', multiple = FALSE),
                                        uiOutput("renderstandards"),
                                        actionButton("std_getstandards", label = "Get Standards")
                                ),
                                fluidRow(
                                        h3("Predicted SAFER Scores based on observed events.", align = "center", color = "blue"),
                                        column(width = 4, flexdashboard::gaugeOutput("min_risk_gauge")),
                                        column(width = 4, flexdashboard::gaugeOutput("avg_risk_gauge")),
                                        column(width = 4, flexdashboard::gaugeOutput("max_risk_gauge"))
                                ),
                                fluidRow(
                                        plotOutput("probPlot") 
                                )
                        ),
                        
                        # Second tab content
                        tabItem(tabName = "hospital",
                                fluidRow(
                                        selectInput("hosp_standards", label = h3("Select Standard"), choices = get_chapter_names_only(), selected = 'Infection Prevention and Control-IC.02.02.01', multiple = FALSE),
                                        actionButton("hosp_getstandards", label = "Get Standards")
                                ),
                                fluidRow(
                                        dataTableOutput("hosp_table")
                                )
                        )
                )
        )
)






