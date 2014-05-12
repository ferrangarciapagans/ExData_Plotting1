# Code to read the data set
data <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE)

# Convert date format
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")

# filter rows by date
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

# Covert numeric format
data[,7] <- as.numeric(as.character(data[,7]))
data[,8] <- as.numeric(as.character(data[,8]))
data[,9] <- as.numeric(as.character(data[,9]))

# Create a new Col with a timestamp
timestamp <- strptime(paste(data[,1],", ",data[,2]), format="%Y-%m-%d , %H:%M:%S")
data <- cbind(data, timestamp)

# Create the plot
plot(data[,10], data[,7], type="n", xlab="", ylab="Energy sub metering")
lines(data[,10], data[,7], col="black")
lines(data[,10], data[,8], col="red")
lines(data[,10], data[,9], col="blue")
legend("topright", pch="__", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# Copy the plot to a PNG file
dev.copy(png, file="plot3.png",width = 480, height = 480)

# Close the PNG device
dev.off()
