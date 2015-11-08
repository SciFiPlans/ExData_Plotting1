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

#Getting data ready for plotting
dpa <- as.numeric(as.character(dataf$Sub_metering_1))
dpb <- as.numeric(as.character(dataf$Sub_metering_2))
dpc <- as.numeric(as.character(dataf$Sub_metering_3))

#Label
yaxtext <- "Energy sub metering"

# Start PNG device driver to save output
png(filename="plot3.png", height=480, width=480, bg="white")

#Plotting the line graphs
plot(dataf$DateTime,dpa,type = "l",xlab = "", ylab = yaxtext, col = "black")
lines(dataf$DateTime,dpb, type = "l", col = "red")
lines(dataf$DateTime,dpc, type = "l", col = "blue")

#The legend
legend("topright", names(dataf)[7:9], col = c("black", "red","blue"), lwd = 1) 

# Turn off device driver (to flush output to png)
dev.off()
