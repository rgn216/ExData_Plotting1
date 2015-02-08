plot2 <- function(){
      
      vars <- c( "character" , "character" , rep( "numeric" , 7 ) )       
      data <- read.table("household_power_consumption.txt", header = TRUE , sep =";" ,colClasses=vars ,na.strings = "?")
      data <- filter(data , (Date == "1/2/2007")|(Date == "2/2/2007")  )
      
      # Adding a datetime variable
      data$datetime <- paste( data$Date , data$Time )
      data$datetime <- as.POSIXct(data$datetime , format = "%d/%m/%Y %H:%M:%S")
      
      png('plot2.png')
      plot( data$datetime , data$Global_active_power , type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )            
      dev.off()
      
      

}