

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

frankenstein <- readtext("data/Frankenstein_Or_The_Modern_Prometheus.txt")


#-------------------------------- tokenize data -------------------------------
#Text mining is a term that covers a large variety of approaches and concrete methods. 
#In this example we will use the tidytext approach, which is presented in the book Text Mining with R - a tidy approach. 
#This code takes the dataset Frankenstein and applies unnest_tokens(word, text), which tokenizes the text column into individual words. 
#Each word becomes a separate row in the new dataset frankenstein_tidy, stored in the word column. 
#This process is commonly used in text mining to break text into manageable units for analysis

frankenstein_tidy <- frankenstein %>% 
  unnest_tokens(word, text)

#------------------------------- most occurring words -------------------------
#Since we now has the text from the articles on the one word pr. row-format we can count the words to see, which words are used most frequently.

frankenstein_tidy %>% 
  count(word, sort = TRUE)

#------------------------------- remove stopwords -----------------------------
#Not surprisingly, particles are the most common words we find. This is not particularly interesting for us in this enquiry. 
#We sort them out by using a stop word list: Using this list (from the tidytext library) for sorting out the words we can redo the counting:

frankenstein_no_stopwords <- frankenstein_tidy %>% 
  anti_join(stop_words, by = "word")

#------------------------------- sort data ------------------------------------
#Now we sort the words in descenting order 

frankenstein_sorted <- frankenstein_no_stopwords %>% 
  count(word, sort = TRUE) %>% 
  mutate(word = reorder(word, n))

#------------------------------ visualization ---------------------------------
#We use ggplot to make a bar chart showing the most frequently used words in the novel

frankenstein_sorted %>% 
  head(10) %>%
  ggplot(., aes(x = word, y = n, fill = n)) +
  geom_col() +
  coord_flip() +
  scale_fill_viridis_c() +
  geom_label(aes(x = word, y = n, label = n),    
             vjust = "top", hjust = "center",
             fill = "white", color = "black", 
             size = 3) +
  labs(title = "The frequency of word occurrences in the corpus",
       x = "Word", 
       y = "Frequency", 
       fill = "Frequency")

