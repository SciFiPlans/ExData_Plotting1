#Data file name and location:
filename <- 'household_power_consumption.txt'

#Reading the data
dataa <- read.table(filename, sep = ";", header = TRUE)

#Creating new column with combined Date and Time
dataa$DateTime <- strptime(paste(dataa$Date, dataa$Time), format = "%d/%m/%Y %H:%M:%S")

#Selecting data from the first two days of February
data1 <- dataa[(dataa$Date == "1/2/2007"),]
data2 <- dataa[(dataa$Date == "2/2/2007"),]
dataf <- rbind(data1,data2)

# Start PNG device driver to save output
png(filename="plot2.png", height=480, width=480, bg="white")

#Getting data ready for plotting
datap <- as.numeric(as.character(dataf$Global_active_power))

#label
yaxtext <- "Global Active Power (kilowatts)"

#Plotting the line graph
plot(dataf$DateTime,datap,type = "l",xlab = "", ylab = yaxtext)

# Turn off device driver (to flush output to png)
dev.off()