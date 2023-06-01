

# load in packages

library(readxl)
library(tidyverse)
library(ggplot2)
library(scales)

# load input data

NN_inputs <-
  read_excel("Files/Input Data.xlsx", sheet = "NN Raw Data")


LA_names <-
  read_excel("Files/Input Data.xlsx", sheet = "Area Names")
NN_inputs<-LA_names%>%
  left_join(NN_inputs,by=c("LA Code"="Area Code"))%>%
  select(-c(`Area Name`,`LA Code`))


NN_inputs<-as.data.frame(NN_inputs)
rownames(NN_inputs)<-NN_inputs[,1]
NN_inputs[,1] <- NULL
NN_inputs[]<-as.data.frame(lapply(NN_inputs,as.numeric))
