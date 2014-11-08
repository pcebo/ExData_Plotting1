#load the dataset from working directory
dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#subset the dataset as needed
plot_dataset <- dataset[dataset[,1]=="1/2/2007" | dataset[,1]=="2/2/2007",]

#plot the histogram
hist(as.numeric(as.character((plot_dataset[,3]))), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

#output to a png and close the device
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()        
