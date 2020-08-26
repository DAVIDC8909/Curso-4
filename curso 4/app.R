library("data.table")

setwd("C:/Users/david/Desktop/Coursera/curso 4")# cambiar la direccion donde este el .txt
data <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)
#punto 1
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png("grafico.png", width=480, height=480)
hist(data[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

#punto 2
data <- data.table::fread(input = "household_power_consumption.txt"
                          , na.strings="?")
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

data <- data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("grafico2.png", width=480, height=480)
plot(x = data[, dateTime]
     , y = data[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
#punto 3
data <- data.table::fread(input = "household_power_consumption.txt"
                          , na.strings="?")



data <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)


data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
data <- data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("Grafico3.png", width=480, height=480)

plot(data[, dateTime], data[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(data[, dateTime], data[, Sub_metering_2],col="red")
lines(data[, dateTime], data[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
#punto 4
data <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
data <- data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("Grafico 4.png", width=480, height=480)

par(mfrow=c(2,2))


plot(data[, dateTime], data[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

plot(data[, dateTime],data[, Voltage], type="l", xlab="datetime", ylab="Voltage")

plot(data[, dateTime], data[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(data[, dateTime], data[, Sub_metering_2], col="red")
lines(data[, dateTime], data[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 
plot(data[, dateTime], data[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

