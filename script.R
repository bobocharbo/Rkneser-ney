### Set the working directory where the unigram, bigram and trigram are stored 
main_dir <- getwd()



### Set the working directory where the unigram, bigram and trigram are stored 
if (dir.exists(file.path(main_dir, 'datas'))){
    setwd("datas/")
}else {
    dir.create(file.path(main_dir, 'datas'))
    setwd(file.path(main_dir, 'datas'))
}

## Import the datas as unigramDF, bigramDF, trigramDF
for (file in dir()) load(file)

### 3 DataFrames sont disponibles :
  # unigramDF : { unigram : (str), freq : (int) }
  # bigramDF : { bigram : (str), freq : (int), unigram : (str), name : (str) }
  # trigramDF : { trigram : (str), freq : (int), bigram : (str), name : (str) }
  
