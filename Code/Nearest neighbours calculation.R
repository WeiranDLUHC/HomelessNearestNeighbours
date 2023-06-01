## Calculates nearest neighbours
# Dependencies: Load input data

nvars<-ncol(NN_inputs) 
nlas<-nrow(NN_inputs) 
scaled_NN_inputs<-scale(NN_inputs) #scale the CIPFA data matrix (standardize)

#create a min max normalization function
min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

#create a empty final matrix to input the data
final_matrix<-matrix(0L,nrow=nlas,ncol=nlas) #nrows and ncol is the number of areas

# create a distance matrix for each column of the CIPFA feature
# standardize each of the columns so that 0 is the nearest neighbour and 1  is the furthest
# add all the standardized matrix for each column together 

for (i in 1:nvars){
  dis_matrix<-dist(scaled_NN_inputs[,i])
  dis_matrix<-as.data.frame(as.matrix(dis_matrix))
  dis_matrix[]<- as.data.frame(lapply(dis_matrix, min_max_norm))
  
  final_matrix<-final_matrix+dis_matrix
}#note that 1:X, where x is the number of variables

#Divide by the number of columns and get the topN rownames for each column
# save the output
# 20 used as 20 nearest neighbours

f<-function(x) names(sort(x,decreasing=F))
final_matrix<-final_matrix/20
final_matrix_names<-apply(final_matrix,2,f)

# clean up final matrix
final_matrix_names <- rbind(colnames(final_matrix_names), final_matrix_names)
final_matrix_names<-t(final_matrix_names)
colnames(final_matrix_names) <-c("NN",1:(ncol(final_matrix_names)-1))
write.csv(final_matrix_names[],"Nearest Neighbours Table.csv",row.names = FALSE)

