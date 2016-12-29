### Set the working directory where the unigram, bigram and trigram are stored 

setwd("/home/bobo/cours/markov/kneser-ney/nlpshiny-master/datas")

## Import the datas as unigramDF, bigramDF, trigramDF
for (file in dir()) load(file)
rm(file)



