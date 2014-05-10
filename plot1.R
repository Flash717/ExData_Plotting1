# set working directory
setwd("C:/Users/10131433/Dropbox/eLearning/Data Science/4 Exploratory Data Analysis/W1");
# read data
housepower <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?");
housepower$Date <- as.Date(housepower$Date, "%d/%m/%Y");
housepower$Time <- strptime(housepower$Time, "%H:%M:%S");
# summary(housepower);
# str(housepower);
# head(housepower, n=3);
data <- subset(housepower, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"));
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, xlab="Global Active Power (kilowats)", main="Global Active Power", col="red");
dev.off()
