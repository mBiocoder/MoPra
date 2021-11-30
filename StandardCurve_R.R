library(ggplot2)
library(data.table)

#Read file
#setwd("C:/Users/Semester5/MoPra/LabReports/Report2/src")
data <- read.csv("curvedata", sep="\t")
data


#store columns from file in seperate variables
conz <- data$Protein_concentration
od <- data$OD

#print if correct format
#conz
#od

#Plot standard curve
# Basic scatter plot
plot(conz,od, ylab = "OD_750", xlab="[BSA] mg/ml", main="Standard curve")
abline(lm(od~conz), col="red")
#plot with ggplot
ggplot(data, aes(x=Protein_concentration, y=OD)) + geom_point() +
  geom_smooth(method='lm',se=FALSE) + ylab("OD_750") +xlab("[BSA] mg/ml") +
  ggtitle("Standard curve") + theme(plot.title = element_text(hjust = 0.5))

#read next file
data2 <- read.csv("concentration.txt", sep="\t")
data2

#find the protein concentration
unkown_od <- data2$OD
unkown_od

od_vector <- c(unkown_od)
od_vector

result<- function (x){
  result <- (x - 0.0285)/0.345
  print(result)
}

final <- result(od_vector)

#write to output file
write.csv(final, file = "output.csv", row.names = FALSE)

#check the output file
df <- read.csv("output.csv")
df
