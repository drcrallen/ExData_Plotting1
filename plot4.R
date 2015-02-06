# household_power_consumption.txt is excluded from this repository
# Information on household_power_consumption.txt can be found in the README.md
household_power_consumption <- read.csv2("household_power_consumption.txt", na.strings="?", dec=".", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
household_power_consumption$Date_ <- as.POSIXlt(paste(household_power_consumption$Date,household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")
household_power_consumption <- subset (household_power_consumption, household_power_consumption$Date_ >= "2007-02-01" & household_power_consumption$Date_ < "2007-02-03")
# These should be default width and height, but for safe measure we specify
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
# As per plot2.R
plot(household_power_consumption$Date_, household_power_consumption$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
# As per plot3.R
with(household_power_consumption, {
    plot(Date_, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
    lines(Date_, Sub_metering_1, col = "black")
    lines(Date_, Sub_metering_2, col = "red")
    lines(Date_, Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")
})
plot(household_power_consumption$Date_, household_power_consumption$Voltage,main = "", xlab = "datetime", ylab = "Voltage", type = "l")
plot(household_power_consumption$Date_, household_power_consumption$Global_reactive_power,main = "", xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()