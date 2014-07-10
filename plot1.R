#read in the whole table
a <- read.table("household_power_consumption.txt", 
                colClasses = c("character", "character", rep("numeric", 7)), 
                sep=";", nrows=2075260, header=TRUE, na.strings="?")

# extract just the dates "2007-02-01" and "2007-02-02"
b <- subset(a, Date == "1/2/2007" | Date == "2/2/2007")

# histogram of Global Active Power
png("plot1.png")

hist(b$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", col = "red", 
     main = "Global Active Power")

dev.off()