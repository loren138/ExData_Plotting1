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

## Open the PNG
png(height = 480, width = 480, filename = "plot1.png")

## Make the Histogram
hist(
    data$Global_active_power, 
    col = "red",
    xlab = "Global Active Power (kilowatts)", 
    main = "Global Active Power"
)

## Close Things
dev.off()