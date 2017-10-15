data1<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F,stringsAsFactors=F, comment.char="", quote='\"')
data1_sub <- subset(data1, Date %in% c("1/2/2007","2/2/2007"))
data1_sub$Date<-as.Date(data1_sub$Date,format="%d/%m/%Y")
datetime <- paste(as.Date(data1_sub$Date), data1_sub$Time)
data1_sub$Datetime <- as.POSIXct(datetime)

#plot_2
with(data1_sub, {
  plot(Global_active_power~Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
  })
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()