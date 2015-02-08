plot4 <- function(){
      
      vars <- c( "character" , "character" , rep( "numeric" , 7 ) )       
      data <- read.table("household_power_consumption.txt", header = TRUE , sep =";" ,colClasses=vars ,na.strings = "?")
      data <- filter(data , (Date == "1/2/2007")|(Date == "2/2/2007")  )
      
      # Adding a datetime variable
      data$datetime <- paste( data$Date , data$Time )
      data$datetime <- as.POSIXct(data$datetime , format = "%d/%m/%Y %H:%M:%S")
      
      png('plot4.png')
      par( mfcol = c( 2,2 ))
      
      #PLOT 1

      plot( data$datetime , data$Global_active_power , type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )            
      
      #PLOT 2
      
      plot( data$datetime , data$Sub_metering_1 , type = "l", xlab = "", ylab = "Energy sub metering" )
      lines( data$datetime , data$Sub_metering_2 , col = "red", type = "l", xlab = "", ylab = "Energy sub metering" )
      lines( data$datetime , data$Sub_metering_3 , col = "blue" , type = "l", xlab = "", ylab = "Energy sub metering" )
      legend("topright" , legend = c( "Sub_metering_1","Sub_metering_2","Sub_metering_3" ) , col = c("black" , "red","blue") ,lwd = .75, cex = .75)      
      
      #PLOT 3
      
      plot( data$datetime , data$Voltage , type = "l", xlab = "datetime", ylab = "Voltage" )
      
      #PLOT 4
      
      plot( data$datetime , data$Global_reactive_power , type = "l", xlab = "datetime", ylab = "Voltage" )
      
      
      dev.off()
}