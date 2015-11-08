
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
png(filename="plot4.png", height=480, width=480, bg="white")
par(mfrow=c(2,2))

#Plot 1
#Getting data ready for plotting
datap <- as.numeric(as.character(dataf$Global_active_power))

#label
yaxtext <- "Global Active Power (kilowatts)"

#Plotting the line graph
plot(dataf$DateTime,datap,type = "l",xlab = "", ylab = yaxtext)

#Plot 2
#Getting data ready for plotting
datap <- as.numeric(as.character(dataf$Voltage))

#label
yaxtext <- "Voltage"
xaxtext <- "datetime"

#Plotting the line graph
plot(dataf$DateTime,datap,type = "l",xlab = xaxtext, ylab = yaxtext)

#Plot 3

#Getting data ready for plotting
dpa <- as.numeric(as.character(dataf$Sub_metering_1))
dpb <- as.numeric(as.character(dataf$Sub_metering_2))
dpc <- as.numeric(as.character(dataf$Sub_metering_3))

#Label
yaxtext <- "Energy sub metering"

#Plotting the line graphs
plot(dataf$DateTime,dpa,type = "l",xlab = "", ylab = yaxtext, col = "black")
lines(dataf$DateTime,dpb, type = "l", col = "red")
lines(dataf$DateTime,dpc, type = "l", col = "blue")

#The legend
legend("topright", names(dataf)[7:9], col = c("black", "red","blue"), lwd = 1) 

#Plot 4
#Getting data ready for plotting
datap <- as.numeric(as.character(dataf$Global_reactive_power))

#label
yaxtext <- "Global_reactive_power"
xaxtext <- "datetime"

#Plotting the line graph
plot(dataf$DateTime,datap,type = "l",xlab = xaxtext, ylab = yaxtext)

# Turn off device driver (to flush output to png)
dev.off()