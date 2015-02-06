# household_power_consumption.txt is excluded from this repository
# Information on household_power_consumption.txt can be found in the README.md
household_power_consumption <- read.csv2("household_power_consumption.txt", na.strings="?", dec=".", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
household_power_consumption$Date_ <- as.POSIXlt(paste(household_power_consumption$Date,household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")
household_power_consumption <- subset (household_power_consumption, household_power_consumption$Date_ >= "2007-02-01" & household_power_consumption$Date_ < "2007-02-03")
# These should be default width and height, but for safe measure we specify
png("plot1.png", width = 480, height = 480)
hist(household_power_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)")
dev.off()