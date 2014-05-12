# Code to read the data set
data <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE)

# Convert date format
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")

# filter rows by date
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

# Covert GAP format
data[,3] <- as.numeric(as.character(data[,3]))

# Create the histogram in the screen device
hist(data[,3], col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

# Copy the plot to a PNG file
dev.copy(png, file="plot1.png",width = 480, height = 480)

# Close the PNG device
dev.off()