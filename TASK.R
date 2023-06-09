#I set as working directory manual
#Read file
ALLO<-read.csv('G1_Allometry.csv')

#Get number of rows
nrow(ALLO)

#Get number of columns
ncol(ALLO)

#Get info about this file
str(ALLO)
dim(ALLO)

#Filtering 
filter1<-ALLO[ALLO$species=='PSME',]
filter1

#Change the names of columns
colnames(ALLO)<-c("col of species" ,"col of diameter" ,"col of height" ,"col of leafarea" ,"col of branchmass")

#Filtering
filter2<-ALLO[ALLO$`col of species`=="PIPO"&ALLO$`col of diameter`<33.27, ]
filter2

#Sorting
sortcom<-ALLO[order(ALLO$"col of diameter"),]
sortcom

#Compute new variable from old
ALLO$weight[ALLO$"col of branchmass">250]<-("heavy")
ALLO$weight[ALLO$"col of branchmass"<250]<-("light")
ALLO

#Get mean of specific columns
mean(ALLO$`col of height`)
mean(ALLO$`col of height`,na.rm = T)

#Get all columns and rows except row number 2
ALLO[-2,]

#IS there any repeat?
any(duplicated(ALLO))

#Get incomplete rows
ALLO[!complete.cases(ALLO),]

#Visualization
#Dot plot
library(ggplot2)
draw1<-ggplot(ALLO)
draw1<-ggplot(ALLO,aes(x=height ,y=diameter))
draw1
draw2ALLO<-ggplot(ALLO,aes("col of leafarea"))
View(draw2ALLO)

#Histogram
draw2ALLO+geom_histogram()
draw2ALLO+geom_histogram(bandwidth=7)
draw2ALLO+geom_histogram(color="blue")
draw2ALLO+geom_histogram(fill="yellow")
draw2ALLO+geom_histogram()+ggtitle("col of diameter")
draw2ALLO+geom_histogram()+labs(x="col of diameter",y="col of leafarea")
ALLObar<-ggplot(ALLO,aes(x="col of diameter",fill="col of height"))
View(ALLObar)
ALLObar+geom_bar()
ALLObar+geom_bar()+theme_dark()

#Scatter plot
ALLOscatter<-ggplot(ALLO,aes("col of brancnhmass","col of leafarea"))
ALLOscatter

#IS there any NA in data?
is.na(ALLO)
any(is.na(ALLO$"col of height"))

#Get rows that have NA in height
NAheight<-ALLO[is.na(ALLO$"col of height"),]
NAheight

#cleaning data
ALLO$`col of height`<gsub(",",'',ALLO$`col of height`)
ALLO
#removing rows containing missing value in col of height  
ALLO<-ALLO[!is.na(ALLO$`col of height`), ]
ALLO
rownames(ALLO)<-NULL
view(ALLO)
#Change the data type
ALLO$`col of height`<-as.integer(ALLO$`col of height`)