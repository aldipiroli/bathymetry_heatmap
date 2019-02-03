rm(list=ls()) #clear envirment var
cat("\014") #console clear
setwd(path.expand("/home/aldi/R-Dev/HeatMapper_v0.1/read_write_database/")) #set dir path

#---------------------------------------------------------------------------------------#
library(RMySQL)
mydb = dbConnect(MySQL(), user='root', password='root', dbname='example', host='localhost')

# dbListTables(mydb)
# dbListFields(mydb, 'prova_1')
rs = dbSendQuery(mydb, "select * from data_1")
data = fetch(rs, n=-1)
data
write.csv(data, file = "foo.csv")