rm(list=ls()) #clear envirment var
cat("\014") #console clear
setwd(path.expand("/home/aldi/R-Dev/HeatMapper_v0.1/read_write_database/")) #set dir path

#---------------------------------------------------------------------------------------#
require(stringr)
library(RMySQL)
filepath = "data/data_from_serial.txt"
testVector <- str_split(readLines(filepath), pattern = "\n")

#---------------------------------------------------------------------------------------#
# find dimension of real data
#---------------------------------------------------------------------------------------#
for (i in 1:length(testVector))
{

  if(testVector[[i]] == "data_flow_ON")
  {
    data_ind_beg = i
  }
  if(testVector[[i]] == "data_flow_OFF")
  {
    data_ind_end = i
  }
}

#---------------------------------------------------------------------------------------#
# save real data in dataframe
#---------------------------------------------------------------------------------------#
copy = FALSE
data_frame <- data.frame("0","0","0","0")
colnames(data_frame) <- c("lat","long","ID_1","data_1") 

for (i in (data_ind_beg+2):(data_ind_end-1))
{
  data_matrix <- unlist(strsplit(testVector[[i]] , split=","))
  data_frame<- rbind(data_frame,data.frame(lat = data_matrix[1],long = data_matrix[2],ID_1 = data_matrix[3],data_1 = data_matrix[4]))
  #print(data_matrix[3])
}
data_frame <- data_frame[-1,] #delate 1 row
data_frame
#---------------------------------------------------------------------------------------#
# connect & write to databse
#---------------------------------------------------------------------------------------#
mydb = dbConnect(MySQL(), user='root', password='root', dbname='example', host='localhost')
dbRemoveTable(mydb,"data_1") #delate table
dbWriteTable(mydb, name='data_1', value=data_frame)

# dbListTables(mydb)
# dbListFields(mydb, 'prova_1')
# rs = dbSendQuery(mydb, "select * from data_1")
# data = fetch(rs, n=-1)
# data$lat

