# Code to read the data set
data <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE)

# Convert date format
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")

# filter rows by date
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

# Covert GAP format
data[,3] <- as.numeric(as.character(data[,3]))

# Create a new Col with a timestamp
timestamp <- strptime(paste(data[,1],", ",data[,2]), format="%Y-%m-%d , %H:%M:%S")
data <- cbind(data, timestamp)

# Create the Plot
plot(data[,10], data[,3], type="n", xlab="", ylab="Global Active Power (Kilowatts)")
lines(data[,10], data[,3])

# Copy the plot to a PNG file
dev.copy(png, file="plot2.png",width = 480, height = 480)

# Close the PNG device
dev.off()