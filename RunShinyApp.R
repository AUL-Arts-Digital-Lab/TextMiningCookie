# Load the necessary packages to run the application. These packages extend the base functionality of R, allowing us to open and work with applications that have a user interface, as in the case of ShinyTextMining.
library(shiny)
library(thematic)
library(readtext)
library(writexl)
library(DT)
library(tidyverse)
library(tidytext)
library(quanteda)
library(quanteda.textstats)
library(ggraph)
library(igraph)
library(ggwordcloud)
library(tidygraph)

# Here we tell R to open the ShinyTextMining application hosted on GitHub under AUL-BSS-Datalab
runGitHub("TextMining_en", "AUL-BSS-Datalab")