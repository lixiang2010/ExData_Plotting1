df <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
df$Time <- paste(df$Date, df$Time)
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df1 <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
df1$Time <- strptime(df1$Time, format = "%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow = c(2, 2))

plot(df1$Time, df1$Global_active_power,type = "l",xlab="",ylab="Global Active Power")

plot(df1$Time, df1$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot_colors <- c("black","red","blue")
plot(df1$Time,df1$Sub_metering_1,type="l",col=plot_colors[1], xlab="",ylab = "Energy sub metering")
lines(df1$Time,df1$Sub_metering_2,col=plot_colors[2])
lines(df1$Time,df1$Sub_metering_3,col=plot_colors[3])
legend("topright", names(df1[7:9]),col=plot_colors, lty=1, bty = "n")

plot(df1$Time, df1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()