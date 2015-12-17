library(shiny)

fluidPage (theme = "bootstrap.css", 
  
  titlePanel(h4(strong("TEXT ANALYTICS APP"),align = "center" )),
  hr(),
  
  sidebarLayout(
    
    sidebarPanel(
      textInput("selection", h5(strong("Upload text:")),
                  value = words),
     actionButton("update1", "Submit", class="btn-info"),
     
      actionButton("update", "Parse", class="btn-info"),
      hr(), hr(),
      checkboxGroupInput("check", 
                         label = h5(strong("Word List")), 
                         choices = list,
                         selected = ""),
      actionButton("update2", "Add",class="btn-info")
      
                ),
    mainPanel( 
      tabsetPanel(id = 1,
                  tabPanel(h5(strong("Input text")), textOutput("data1"))),
                  hr(),
                  #hr(),
            #hr(), hr(), hr(), 
        tabsetPanel(id = 2,
                  tabPanel(h5(strong("Output text")), textOutput("data"))),
        actionButton("update3", "Add to Checkbox", class="btn-info"),
           hr(), hr(),
      tabsetPanel(id = 3,
                  tabPanel(h5(strong("Key words")), textOutput("data2"))),
      downloadButton('downloadData', 'Download', class="btn-info")
      )
    )
  )

    
   
  



  

 
