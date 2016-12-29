## Load a csv file
### Change your path here : 
main_dir <- getwd()
samples <- read.csv(file = "wuthering_heights.csv",sep=',',stringsAsFactors = FALSE,header=TRUE)

## Extract the reviews 
reviews <- samples[['review']]

## Tokenize a comment : 
comments <- list()

first_words <- NULL
next_words <- NULL
unigramDF <- data.frame(unigram= character(0), freq= numeric(0),stringsAsFactors = F)
bigramDF <- data.frame(bigram= character(0), freq= integer(0), unigram = character(0), name = character(0),stringsAsFactors = F)
trigramDF <- data.frame(trigram=character(0), freq= integer(0), bigram = character(0), name=character(0),stringsAsFactors = F)

#Compteur :
k <- 1
k_bi <- 1
k_tri <- 1

for (i in 1:length(reviews)){
  
  tokenized_review <- strsplit(gsub(pattern = "\\.", replacement = " ", x=gsub(pattern="\\,", replacement=" ",x=trimws(reviews[[i]])))," ")[[1]]
  tokenized_review <- tokenized_review[tokenized_review!=""]
  tokenized_review[which(tokenized_review != 'I')] <- tolower(tokenized_review[which(tokenized_review != 'I')])
  first_words <- c(first_words,tokenized_review[1])
  next_words <- c(next_words,tokenized_review[2])
  comments[[i]] <- tokenized_review
    
    for (indice in 1:(length(tokenized_review)-3)){
      
        unigram <- tokenized_review[indice]
        bigram <- paste(unigram,tokenized_review[indice + 1],sep=" ")
        trigram <- paste(bigram, tokenized_review[indice + 2],sep=" ")
    
    ## Unigram
        if (unigram %in% unigramDF[['unigram']]){
            unigramDF[which(unigramDF[['unigram']] == unigram),'freq'] <- unigramDF[which(unigramDF[['unigram']] == unigram),'freq'] + 1
        }
        else{
            unigramDF[k,'unigram'] <- unigram
            unigramDF[k,'freq'] <- 1
            k <- k+1
        }
    ## Bigram
        if (indice <= length(tokenized_review) - 1){
            if (bigram %in% bigramDF[['bigram']]){
              bigramDF[which(bigramDF[['bigram']] == bigram),'freq'] <- bigramDF[which(bigramDF[['bigram']] == bigram),'freq'] + 1
            }
            else{
              bigramDF[k_bi,'unigram'] <- unigram
              bigramDF[k_bi,'bigram'] <- bigram
              bigramDF[k_bi,'name'] <- tokenized_review[indice + 1]
              bigramDF[k_bi,'freq'] <- 1
              k_bi <- k_bi+1
            }  
        }
        
    ## Trigram
        if (indice <= length(tokenized_review) - 2){
            if (trigram %in% trigramDF[['trigram']]){
              trigramDF[which(trigramDF[['trigram']] == trigram),'freq'] <- trigramDF[which(trigramDF[['trigram']] == trigram),'freq'] + 1
            }
            else{
              trigramDF[k_tri,'bigram'] <- bigram
              trigramDF[k_tri,'trigram'] <- trigram
              trigramDF[k_tri,'name'] <- tokenized_review[indice + 2]
              trigramDF[k_tri,'freq'] <- 1
              k_tri <- k_tri+1
            }  
        }
    }
  
}
    ## Remplir les dataframes unigram, bigram, et trigram à partir de là :
if (dir.exists(file.path(main_dir, 'datas'))){
    setwd("datas/")
}else {
    dir.create(file.path(main_dir, 'datas'))
    setwd(file.path(main_dir, 'datas'))
}


save(first_words,file='starter.Rdata')
save(next_words,file='second.Rdata')
save(unigramDF,file='unigram.Rdata')
save(bigramDF,file='bigram.Rdata')
save(trigramDF,file='trigram.Rdata')

  
  
  
  
