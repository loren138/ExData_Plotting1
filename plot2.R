## Read in Data
data <- read.csv(
    file="household_power_consumption.txt",
    header=TRUE,
    sep=";",
    colClasses = c("character", "character", rep("numeric", 7)),
    na.strings = c("", "?")
)

## Subset
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data$Date <- apply(data[,c("Date", "Time")], 1, function(x) paste(x, collapse = " "))
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")

## Open the PNG
png(height = 480, width = 480, filename = "plot2.png")

## Make the Graph
plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Close Things
dev.off()