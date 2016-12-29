### Set the working directory where the unigram, bigram and trigram are stored 
#source("generate_ngram.R")



### Set the working directory where the unigram, bigram and trigram are stored 


## Import the datas as unigramDF, bigramDF, trigramDF
for (file in dir('datas')) load(file)

### 3 DataFrames sont disponibles :
  # unigramDF : { unigram : (str), freq : (int) }
  # bigramDF : { bigram : (str), freq : (int), unigram : (str), name : (str) }
  # trigramDF : { trigram : (str), freq : (int), bigram : (str), name : (str) }
 
# Calcul de la probabilité pour un mot

proba_unigramme <- function(mot, bigramme) {
  probs <- sum(bigramme$name==mot)/nrow(bigramme)
  return(probs)
  }

# Calcul des probabilités des unigrammes pour tous les mots du corpus

prob_uni <- sapply(X=unigramDF$unigram, FUN=proba_unigramme, bigramme=bigramDF)
  
# Calcul de la valeur de réduction
  D <- 1/(nrow(unigramDF) + 2 * nrow(bigramDF))
  
# Calcul de la probabilité conditionnelle pour un bigramme
 
proba_condi_bi <- function(w2,w1,prob_uni, bigramme, D){
  w1w2 <- paste(w1,w2)
  somme <- sum(bigram[bigramme$unigram==w1,'freq'])
  prob_condi <- (max(bigramme[bigramme$bigram==w1w2,'freq']-D,0)/somme) + (D/somme) * sum(bigramme$unigram==w1)*prob_uni[w2]
  }
  
 

