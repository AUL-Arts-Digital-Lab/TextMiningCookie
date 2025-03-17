

#------------------------------- load libraries -------------------------------
#The dataset is processed in the software programme R, offering various methods for statistical analysis and graphic representation of the results. 
#In R, one works with packages each adding numerous functionalities to the core functions of R. In this example, the relevant packages are:

library(tidyverse)
library(tidytext)
library(stopwords)
library(readtext)


#------------------------------- load text data - corpus ----------------------
#The data (Frankenstein) is in txt format and is located in the data folder. The data is in plain text and when we load it into RStudio with the readtext() function, it is structured in a dataframe.
#One column contains the doc_id (the title in this case) and one column contains the entire novel in plain text.




#-------------------------------- tokenize data -------------------------------
#Text mining is a term that covers a large variety of approaches and concrete methods. 
#In this example we will use the tidytext approach, which is presented in the book Text Mining with R - a tidy approach. 
#This code takes the dataset Frankenstein and applies unnest_tokens(word, text), which tokenizes the text column into individual words. 
#Each word becomes a separate row in the new dataset eyre_tidy, stored in the word column. 
#This process is commonly used in text mining to break text into manageable units for analysis



#------------------------------- most occurring words -------------------------
#Since we now has the text from the articles on the one word pr. row-format we can count the words to see, which words are used most frequently.



#------------------------------- remove stopwords -----------------------------
#Not surprisingly, particles are the most common words we find. This is not particularly interesting for us in this enquiry. 
#We sort them out by using a stop word list: Using this list (from the tidytext library) for sorting out the words we can redo the counting:



#------------------------------- sort data ------------------------------------
#Now we sort the words in descenting order 



#------------------------------ visualization ---------------------------------
#We use ggplot to make a bar chart showing the most frequently used words in the novel



