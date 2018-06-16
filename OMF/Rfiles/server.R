function(input, output, session) {
  # Define a reactive expression for the document term matrix
  terms <- reactive({
    # Change when the "update" button is pressed...
    output$secondSelection <- renderUI({
      selectInput("selection2", "Choose a session:",
                  choices = session_labels_data$title[which(session_labels_data$user_id==input$selection1)])
    })
    input$update
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(input$selection2)
      })
    })
  })
  
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  
  output$plot <- renderPlot({
    v <- terms()
    wordcloud_rep(names(v), v, scale=c(4,0.5),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
    text_to_display = session_labels_data$session_labels[which(session_labels_data$title==input$selection2)]
    if (length(text_to_display) != 0) {
      text(x=0, y=0, labels=text_to_display)
    }
  })
}
