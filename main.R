  #Reading file
  hous <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
  
  ## Format date to Type Date
  hous$Date <- as.Date(hous$Date, "%d/%m/%Y")
  
  ## Filter data according to the given dates

  hous<- hous %>% filter(Date >="2007-02-01" & Date <= "2007-02-02")
  
  ## Complete observation
  hous <- hous[complete.cases(hous),]
  
  ## Combine Date and Time column
  dateTime <- paste(hous$Date, hous$Time)
  
  ## Name the vector
  dateTime <- setNames(dateTime, "DateTime")
  
  ## Remove Date and Time column
  hous <- hous[ ,!(names(hous) %in% c("Date","Time"))]
  
  ## Add DateTime column
  hous <- cbind(dateTime, hous)
  
  ## Format dateTime Column
  hous$dateTime <- as.POSIXct(dateTime)