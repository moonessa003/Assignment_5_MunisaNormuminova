library(data.table)
set.seed(123)

data_table_1<-data.table(
  bookID=1:1000,
  genre=sample(c("Sci-Fi","Fantasy","Non-Fiction","Mystery","Biography"),1000,replace=TRUE),
  authorID=sample(1000:9999,1000,replace=TRUE),
  publishedDate=sample(seq(as.Date("1950-01-01"),as.Date("2026-04-15"),by="day"),1000,replace = TRUE)
)
data_table_2<-data.table(
  bookID=sample(1:1000,1400,replace = TRUE),
  reviewweID=sample(1260000:1269999, 1400, replace = TRUE),
  rating=sample(seq(0, 10, by = 0.5), 1400, replace = TRUE)
)

data_table_1[sample(1:1000, 15), publishedDate:=NA]
data_table_1[sample(1:1000, 15), genre:=NA]
data_table_1[sample(1:1000, 15), authorID:=NA]

data_table_2[sample(1:1000, 15), reviewweID:=NA]
data_table_2[sample(1:1000, 15), rating:=NA]

setkey(data_table_1, bookID)
setkey(data_table_2, bookID)
data_table_3<-merge(data_table_1, data_table_2,by="bookID")

data_table_3_cleaned<-data_table_3[complete.cases(data_table_3),]
head(data_table_3_cleaned)
data_table_3_cleaned
