library(tm)
library(wordcloud)
library(memoise)

# The list of valid sessions
filenames <- list.files(path = "C:/Users/swong/Documents/GitHub/flaming-dubstep/OMF/Rfiles/SessionFiles", pattern = NULL, all.files = FALSE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

clean_filename <- function(filename) {
  return(gsub(".txt", "", filename))
}


  #lapply(filenames, clean_filename)
session_labels_data <- read.csv("C:/Users/swong/Documents/GitHub/flaming-dubstep/OMF/data/sessions_w_labels.csv")
session_labels_data <- session_labels_data[order(session_labels_data$date), ]
session_labels_data$session_labels
session_labels_data$session_labels = lapply(session_labels_data$session_labels, as.character)
sessions <- session_labels_data$title
userids <- unique(session_labels_data$user_id)

# Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(session) {
  # Careful not to let just any name slip in here; a
  # malicious user could manipulate this value.
  if (is.null(session)) {
    session = sessions[1]
    print("Session is null")
  } else {
    print("Session is not null")
  }

  if (!(session %in% sessions))
    stop("Unknown session")

  filename <- session_labels_data$id[which(session_labels_data$title==session)]
  text <- readLines(sprintf("./SessionFiles/%s.txt", filename),
                    encoding="ISO-8859-1")

  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords,
                    c(stopwords("SMART"), "the", "and", "but"))

  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))

  m = as.matrix(myDTM)

  sort(rowSums(m), decreasing = TRUE)
  
})
