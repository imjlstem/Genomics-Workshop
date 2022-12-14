##R code
library(ggplot2)
HiFi_hist <- read.table("HiFi_length.txt")
ggplot(data=HiFi_hist,aes(x=V1,y=V2)) + geom_col()
