##Plot2
plot(hous$Global_active_power~hous$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##Saving copy
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()