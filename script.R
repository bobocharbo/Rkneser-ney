### Set the working directory where the unigram, bigram and trigram are stored 

setwd("datas/")

## Import the datas as unigramDF, bigramDF, trigramDF
for (file in dir()) load(file)
rm(file)



