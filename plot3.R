#load the dataset from working directory
dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

library(reshape2)

#subset the dataset as needed
plot_dataset <- dataset[dataset[,1]=="1/2/2007" | dataset[,1]=="2/2/2007",]

#melt the data set and further subset it
melt_data <- melt(plot_dataset, c(1,2))
plot3_data <- melt_data[melt_data[,3]=="Sub_metering_1" | melt_data[,3]=="Sub_metering_2" | melt_data[,3]=="Sub_metering_3",]

#open the png device. Note that for this graph we decide to do this FIRST, since 
#plotting and then copying causes sizing issues with the legend.
png("plot3.png",width = 480, height = 480)

#create the plot
plot(as.numeric(as.character((plot_dataset[,7]))),type="n", xaxt = 'n', ylab="Energy sub metering", xlab="")
axis(side = 1, at = c(1,1440,2880), labels=c("Thursday", "Friday", "Saturday"))
lines(as.numeric(as.character((plot_dataset[,7]))))
lines(as.numeric(as.character((plot_dataset[,8]))), col="red")
lines(as.numeric(as.character((plot_dataset[,9]))), col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,col=c("black", "red", "blue"))

#close the png device
dev.off()