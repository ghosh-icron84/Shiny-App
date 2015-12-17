library(tm)
library(memoise)
library(SnowballC)

 words <- character(5000L)
 list <- list("contracts", "smart", "closer", "financial", "programs", "technology",
              "abound","align","automatically", "banks","bet","buddy","major","mortgage")
                
 
 getTerm <- memoise(function(words) {
   
   #if (!(word %in% words))
    #stop("Unknown word")
   
  # text <- read.txt(word)
                     #encoding="UTF-8")#

  
  myCorpus = Corpus(VectorSource(words))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords,
                    c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but"))
  #myCorpus <- tm_map(myCorpus, stemDocument)
  myCorpus <- tm_map(  myCorpus, stripWhitespace)
  myCorpus <- tm_map( myCorpus, PlainTextDocument) 
 
  tdm = TermDocumentMatrix(myCorpus,
                            control = list(minWordLength = 1))
  
  m = as.matrix(tdm)
  dtms <- removeSparseTerms(tdm, 0.5)
  dt <- inspect(dtms) 
  
  n = as.matrix(dt)
 sort(rowSums(n), decreasing = TRUE)
 
 
 
 
})

  
   
  
  
  
  
