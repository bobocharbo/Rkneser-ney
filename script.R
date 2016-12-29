### Set the working directory where the unigram, bigram and trigram are stored 
source("generate_ngram.R")



### Set the working directory where the unigram, bigram and trigram are stored 


## Import the datas as unigramDF, bigramDF, trigramDF
for (file in dir('datas')) load(file)

### 3 DataFrames sont disponibles :
  # unigramDF : { unigram : (str), freq : (int) }
  # bigramDF : { bigram : (str), freq : (int), unigram : (str), name : (str) }
  # trigramDF : { trigram : (str), freq : (int), bigram : (str), name : (str) }
  
