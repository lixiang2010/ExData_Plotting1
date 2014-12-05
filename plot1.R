df <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df1 <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png("plot1.png")
hist(df1$Global_active_power, col="red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()