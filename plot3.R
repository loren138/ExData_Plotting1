## Read in Data
data <- read.csv(
    file="household_power_consumption.txt",
    header=TRUE,
    sep=";",
    colClasses = c("character", "character", rep("numeric", 7)),
    na.strings = c("", "?")
);

## Subset
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),];
data$Date <- apply(data[,c("Date", "Time")], 1, function(x) paste(x, collapse = " "));
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S");

## Open the PNG
png(height = 480, width = 480, filename = "plot3.png");

## Make the Graph
plot(data$Date, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering");
lines(data$Date, data$Sub_metering_2, type = "l", col = "red");
lines(data$Date, data$Sub_metering_3, type = "l", col = "blue");
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1);

## Close Things
dev.off();