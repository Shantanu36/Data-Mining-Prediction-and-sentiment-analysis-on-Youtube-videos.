
library('syuzhet')
library("stringi")
library("ggplot2")


getwd()
setwd('/Users/abhishekberad/Desktop/dm')
file_data = list.files('/Users/abhishekberad/Desktop/dm')

file_matrix = matrix( 
   ncol=11,
   byrow = TRUE)
file_count = 1

for (video_file in file_data){
  video_id = read.csv(video_file)
  if (length(video_id$comment) < 10){
    next
  }
  video_id$comment <- tolower(video_id$comment)
  video_id$comment <- gsub("rt", "",video_id$comment)
  video_id$comment <- gsub("rt", "",video_id$comment)
  video_id$comment <- gsub("@\\w+", "",video_id$comment)
  video_id$comment <- gsub("@\\w+", "",video_id$comment)
  video_id$comment <- gsub("[[:punct:]]", "",video_id$comment)
  video_id$comment <- gsub("[[:punct:]]", "",video_id$comment)
  video_id$comment <- gsub("http\\w+", "",video_id$comment)
  video_id$comment <- gsub("http\\w+", "",video_id$comment)
  video_id$comment <- gsub("[ |\t]{2,}", "",video_id$comment)
  video_id$comment <- gsub("[ |\t]{2,}", "",video_id$comment)
  video_id$comment <- gsub("^ ", "",video_id$comment)
  video_id$comment <- gsub("^ ", "",video_id$comment)
  video_id$comment <- gsub(" $", "",video_id$comment)
  
  sentiment_video<-get_nrc_sentiment((video_id$comment))
  Sentimentscores_video<-data.frame(colSums(sentiment_video[,]))
  Sentimentscores_video<-cbind("sentiment"=rownames(Sentimentscores_video),Sentimentscores_video)
  video = c(video_file)
  count = 1
  if (nrow(Sentimentscores_video)<1){
    
    next
  }
  for (count in 1 : nrow(Sentimentscores_video)){
    video = c(video, Sentimentscores_video$colSums.sentiment_video.....[count])
    
  }
  file_matrix2 =  matrix( 
       data = video, # the data elements 
       nrow=1,              # number of rows 
       ncol=11,              # number of columns 
       byrow = TRUE)
  file_matrix = rbind(file_matrix, video)
  
}
file_matrix
colnames(data_comment)[1] <- "Video_ID"
colnames(data_comment)[2] <- "Anger"
colnames(data_comment)[3] <- "anticipation"
colnames(data_comment)[4] <- "disgust"
colnames(data_comment)[5] <- "fear"
colnames(data_comment)[6] <- "joy"
colnames(data_comment)[7] <- "sadness"
colnames(data_comment)[8] <- "surprise"
colnames(data_comment)[9] <- "trust"
colnames(data_comment)[10] <- "negative"
colnames(data_comment)[11] <- "positive"

data_comment2  <- gsub("[.csv ]","'" , data_comment ,ignore.case = TRUE)

write.csv(data_comment,"sentiment_youtube.csv")

write.csv(data_comment, file = "sentiment_youtube.csv",row.names=FALSE)
data_comment <- as.data.frame(file_matrix)
data_comment = data_comment[-1,]
nrow(file_matrix)


