#load the dataset from working directory
dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

library(reshape2)

#subset the dataset as needed
plot_dataset <- dataset[dataset[,1]=="1/2/2007" | dataset[,1]=="2/2/2007",]

#open the png device. Note that for this graph we, as in plot3, do this FIRST, since 
#plotting and then copying causes sizing issues with the legend)
png("plot4.png",width = 480, height = 480)

#set up the charting area to hold 4 charts
par(mfrow=c(2,2))

#plot chart 1
plot(as.numeric(as.character((plot_dataset[,3]))), type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt = 'n')
#add labels (we know from checking the data that there are 1,440 data items for each day)
axis(side = 1, at = c(1,1440,2880), labels=c("Thursday", "Friday", "Saturday"))

#plot chart 2
plot(as.numeric(as.character((plot_dataset[,5]))), type="l", ylab="Voltage", xlab="datetime", xaxt = 'n')
#add labels (we know from checking the data that there are 1,440 data items for each day)
axis(side = 1, at = c(1,1440,2880), labels=c("Thursday", "Friday", "Saturday"))

#plot chart 3
#melt the data set and further subset it
melt_data <- melt(plot_dataset, c(1,2))
plot3_data <- melt_data[melt_data[,3]=="Sub_metering_1" | melt_data[,3]=="Sub_metering_2" | melt_data[,3]=="Sub_metering_3",]
#create the plot
plot(as.numeric(as.character((plot_dataset[,7]))),type="n", xaxt = 'n', ylab="Energy sub metering", xlab="")
axis(side = 1, at = c(1,1440,2880), labels=c("Thursday", "Friday", "Saturday"))
lines(as.numeric(as.character((plot_dataset[,7]))))
lines(as.numeric(as.character((plot_dataset[,8]))), col="red")
lines(as.numeric(as.character((plot_dataset[,9]))), col="blue")
#note we remove the box around the legend using bty = "n"
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty=1, lwd =2.5,col=c("black", "red", "blue"))

#plot chart 4
plot(as.numeric(as.character((plot_dataset[,4]))), type="l", ylab="Global_reactive_power", xlab="datetime", xaxt = 'n')
#add labels (we know from checking the data that there are 1,440 data items for each day)
axis(side = 1, at = c(1,1440,2880), labels=c("Thursday", "Friday", "Saturday"))
#output to a png and close the device

dev.off()