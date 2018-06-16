fluidPage(
  # Application title
  titlePanel("Session Word Cloud"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      selectInput("selection1", "Choose a user id:", 
                  choices = userids),
      #selectInput("selection1", "Choose a user id:", 
      #            choices = userids),
      #actionButton("update1", "Change"),
      #hr(),
      uiOutput("secondSelection"),
      actionButton("update", "Change"),
      hr(),
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1,  max = 50, value = 15),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 300,  value = 75)
    ),
    
    # Show Word Cloud
    mainPanel(
      plotOutput("plot")
    )
  )
)
