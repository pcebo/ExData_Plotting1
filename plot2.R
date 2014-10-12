#load the dataset from working directory
dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
#subset the dataset as needed
plot_dataset <- dataset[dataset[,1]=="1/2/2007" | dataset[,1]=="2/2/2007",]
#create the plot
plot(as.numeric(as.character((plot_dataset[,3]))), type="l", ylab="Global Active Power (kilowatts)")
#output to a png and close the device
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()