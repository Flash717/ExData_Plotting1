# set working directory
setwd("C:/Users/10131433/Dropbox/eLearning/Data Science/4 Exploratory Data Analysis/W1");
# read data
housepower <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?");
# create date-time variable by combining Date and Time column
housepower$datetime <- strptime(paste(housepower$Date, housepower$Time), "%d/%m/%Y %H:%M:%S");
housepower$Date <- as.Date(housepower$Date, "%d/%m/%Y");
## analysis of data during development
# summary(housepower);
# str(housepower);
# head(housepower, n=3);

# get subset of data between Feb 01 and Feb 02 2007
data <- subset(housepower, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"));

# open png device
png(filename="plot4.png", width=480, height=480)

# create 2x2 canvas 
par(mfcol=c(2,2));

# work with data data.frame
with(data, {
  
  ## plot Global active power over the two days
  # create empty plot based on subset 
  plot(datetime, Global_active_power, xlab="", ylab="Global Active Power (kilowats)", main="", type="n");
  # plot line
  lines(datetime, Global_active_power);
  
  ## plot 3 different sub meterings
  # create empty plot
  plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", main="", type="n");
  # plot 3 different lines
  lines(datetime, Sub_metering_1, col="black");
  lines(datetime, Sub_metering_2, col="red");
  lines(datetime, Sub_metering_3, col="blue");
  # plot legend
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"));

  # plot voltage over datetime
  plot(datetime, Voltage, main="", type = "n");
  lines(datetime, Voltage);
  
  # plot Global reactive power over datetime
  plot(datetime, Global_reactive_power, main="", type = "n");
  lines(datetime, Global_reactive_power);
})

# close device
dev.off();
