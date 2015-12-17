library(shiny)

shinyServer(function(input, output, session) {
  
  interms <- reactive({
    input$update1
    isolate({ input$selection })
  }) 
  
  terms <- reactive({
  input$update
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTerm(input$selection)
      })
    })
  })
  addterms <- reactive ({        
     input$update2
    isolate({ input$check })
    })
  
  
#observe({
  # if(input$update3 == 1)
   # { updateCheckboxGroupInput(session, "check", choices = list,
    #                                    selected = "" ,inline = FALSE)  }
    #})
  
 
  output$data1 <- renderText({
     interms()
  })
  
 output$data <- renderText({
  v <- terms()
  names(v)
  })
 output$data2 <- renderText ({
    addterms()
   })
  
 output$downloadData <- downloadHandler(
   filename = function() { paste(input$check, '.csv', sep='') },
   content = function(file) {
     write.csv(addterms(), file = "C:/Users/debapriyag@icrakpo.com/Desktop/Keywords.csv", row.names=FALSE)
   }
 )  
 
 
  }) 
    
      
