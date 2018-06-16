function(input, output, session) {
  # Define a reactive expression for the document term matrix
  
  terms <- reactive({
    # Change when the "update" button is pressed...
    input$update
    # if (is.null(input$selection1)) {
    #   curr_userid = userids[1]
    # } else {
      # curr_userid = input$selection1
    # }

    #input$update
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(input$selection2)
      })
    })
  })
  
  session_select <- reactive({
    input$selection1
    session_labels_data$title[which(session_labels_data$user_id==input$selection1)]
  })
  
  labels <- reactive({
    input$update
    # if (is.null(input$selection2)) {
    #   curr_session = sessions[1]
    # } else {
    isolate({
      curr_session = input$selection2
    })
    # }
    
    session_labels_data$session_labels[which(session_labels_data$title==curr_session)]
  })
  
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  
  output$plot <- renderPlot({
    v <- terms()
    # wordcloud_rep(names(v), v, scale=c(4,0.5),
    #               min.freq = input$freq, max.words=input$max,
    #               colors=brewer.pal(8, "Dark2"))
    wordcloud_rep(names(v), v, scale=c(2,0.2),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
  })
  
  output$labels <- renderText({
    toString(labels())
  })
  
  output$secondSelection <- renderUI({
    selectInput("selection2", "Choose a session:",
                choices = session_select())
  })
}
