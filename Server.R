library(shiny)


shinyServer(function(input, output, session) {
  
  interms <- reactive({
    input$update1
    isolate({ input$selection })
  }) 
  
  fileterms <- reactive({
   input$update1
  isolate ({
    
  inFile <- input$file1
  if (is.null(inFile))
    return(NULL)
  
    read.table(inFile$datapath, header=FALSE, sep="\t")
             
      })
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

   observe({
    ch <- names(terms()) 
    cho <<- as.vector(ch, mode = "character")
    if(input$update == 1)
    { updateCheckboxGroupInput(session, "check", choices = cho,
                               selected = "" )  }
  })
  
  addterms <- reactive ({        
    input$update2
    isolate({ input$check })
  })
  
  observe ({
  if (input$sel == "file1") 
  
  output$data1 <- renderTable({
    fileterms()
  })
 else  if (input$sel == "selection") 
 
  output$data1 <- renderText({
  interms()
})
  })
  
  #output$data <- renderText({
   # v <- terms()
    #x <- names(v) 
  #})
  
 
 output$data2 <- renderText ({
   addterms()
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { paste(input$check, '.csv', sep='') },
    content = function(file) {
      write.csv(addterms(), file = "Keywords.csv", row.names=FALSE)
    }
  )  
  
  
}) 

