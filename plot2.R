df <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
df$Time <- paste(df$Date, df$Time)
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df1 <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
df1$Time <- strptime(df1$Time, format = "%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(df1$Time, df1$Global_active_power,type = "l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()