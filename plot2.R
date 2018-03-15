df <- read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
df$'DateTime' <- strptime(paste(df$Date,df$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
df <- df[,!(names(df) %in% c("Date","Time"))]
df <- subset(df,DateTime >= strptime("01/02/2007 00:00:00","%d/%m/%Y %H:%M:%S"))
df <- subset(df,DateTime <= strptime("03/02/2007 00:00:00","%d/%m/%Y %H:%M:%S"))
png("plot2.png")
with(df,plot(DateTime,Global_active_power,type="n",xlab = "", ylab = "Global Active Power (kilowatts)"))
with(df,lines(DateTime,Global_active_power))
dev.off()