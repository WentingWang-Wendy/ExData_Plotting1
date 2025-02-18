df <- read.csv("~/Desktop/Coursera/household_power_consumption.txt", sep=";")
df<- subset(df, df$Date=="1/2/2007"|df$Date=="2/2/2007")

df$Date<-as.Date(df$Date, format="%d/%m/%Y")
df$Time<-strptime(df$Time, format = "%H:%M:%S")
df[1:1440, "Time"]<-format(df[1:1440, "Time"], "2007-02-01 %H:%M:%S")
df[1441:2880, "Time"]<-format(df[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
plot(df$Time, as.numeric(as.character(df$Global_active_power)),type = "l", xlab = "",ylab = "Global Active Power")
plot(df$Time, df$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub Metering")
with(df, lines(Time, as.numeric(as.character(Sub_metering_1)),col="black"))
with(df, lines(Time, as.numeric(as.character(Sub_metering_2)),col="red"))
with(df, lines(Time, as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", col = c("black","red","blue"), lty = 1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(df$Time, as.numeric(as.character(df$Voltage)), type = "l", xlab = "datetime", ylab = "Voltage")
plot(df$Time, as.numeric(as.character(df$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()