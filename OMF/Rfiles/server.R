function(input, output, session) {
  # Define a reactive expression for the document term matrix
  terms <- reactive({
    # Change when the "update" button is pressed...
    input$update
    if (is.null(input$selection1)) {
      curr_userid = userids[1]
      print("User ID null")
    } else {
      curr_userid = input$selection1
      print("User ID NOT null")
    }
    output$secondSelection <- renderUI({
      selectInput("selection2", "Choose a session:",
                  choices = session_labels_data$title[which(session_labels_data$user_id==curr_userid)])
    })
    
    #input$update
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(input$selection2)
      })
    })
  })
  
  labels <- reactive({
    #input$update
    if (is.null(input$selection2)) {
      curr_session = sessions[1]
      print("Session is null")
    } else {
      curr_session = input$selection2
      print("Session is NOT null")
    }
    session_labels_data$session_labels[which(session_labels_data$title==curr_session)]
  })
  
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  
  output$plot <- renderPlot({
    v <- terms()
    wordcloud_rep(names(v), v, scale=c(4,0.5),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
    
    # if (is.null(input$selection2)) {
    #   curr_session = sessions[1]
    #   print("Session is null")
    # } else {
    #   curr_session = input$selection2
    #   print("Session is NOT null")
    # }
    # text_to_display = session_labels_data$session_labels[which(session_labels_data$title==curr_session)]
    text_to_display = labels()
    text(x=0, y=0, labels=text_to_display)
  })
}
