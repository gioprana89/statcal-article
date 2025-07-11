

#library(webr)


#library(plyr)
library(readxl)
#library(openxlsx)
#library(data.table)
library(shiny)
#library(shinyAce)
#source("chooser.R")

#library(lavaan)

#library(mnormt)
#library(curl)
#library(plspm)


########################################
########UI (User Interface)#############
########################################

modul_literature_review_ui <- function(id) {
  
  
  
  ns <- NS(id)
  
  fluidPage(
    
    
    
    
    uiOutput(ns("buka_pemilihan_informasi")),
    
  
    br(),
    
    
    DT::DTOutput(ns("buka_data")),
    
               
               
               
               
               
    
    
    br()
    
  ) #Akhir Fluidpage
  
  
} #Akhir dari modul_literature_review_ui

#Akhir dari modul_literature_review_ui
#Akhir dari modul_literature_review_ui
#Akhir dari modul_literature_review_ui
#Akhir dari modul_literature_review_ui











































































########################################
################Server##################
########################################



modul_literature_review_server <- function(input, output, session) {
  
  
  
  
  
  
  #uiOutput(ns("buka_pemilihan_informasi")),
  
  
  
  nama_variabel <- function()
  {
    
    dat <- read_xlsx("daftar paper statcal.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    return(nama)
    
    
  }
  
  
  
  
  
  
  output$buka_pemilihan_informasi <- renderUI({
    
    
      
      
      
      
      checkboxGroupInput(session$ns("terpilih_variabel"), 
                         label="Select Variables:", choices = c(nama_variabel()), 
                         selected=c("Title", "Year", "Journal", "Link" ), inline = TRUE)
      
      
  
  })
  
  
  
  
  
  
  
  
  
  
  ##################
  
  
  
  
  
  output$buka_data <- DT::renderDT({
    
    dat <- read_xlsx("daftar paper statcal.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    
    terpilih_variabel <- input$terpilih_variabel
    
    dat_baru <- dat[c(terpilih_variabel)]
    
    print(dat_baru)
    
    
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
} #akhir dari modul_literature_review_server

#akhir dari modul_literature_review_server
#akhir dari modul_literature_review_server
#akhir dari modul_literature_review_server

















































































ui <- fluidPage(
  
  
  #includeHTML("intro_home.html"),
  
  
  uiOutput("modul_literature_review"),
  
  
  br()
  
) #Akhir dari UI











server <- function(input, output) {
  
  
  
  
  
  output$modul_literature_review <- renderUI({
    
    
    
    #source("module//modul_literature_review.R")
    callModule(module = modul_literature_review_server, id = "modul_literature_review")
    modul_literature_review_ui(id = "modul_literature_review")
    
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
} #Akhir dari server










shinyApp(ui, server)














