# Read the CSV file
dataset <- read.csv("regrex1.csv")

# Perform linear regression
model <- lm(formula = y ~ x, data = dataset)

# Load the ggplot2 library
library(ggplot2)

# Create the scatter plot (just the red dots)
scatter_plot <- ggplot(data = dataset, aes(x = x, y = y)) +
  geom_point(color = 'red')

# Set up PNG output device and save the scatter plot as r_orig.png
png(file = "r_orig.png", width = 800, height = 600, res = 150)
print(scatter_plot)
dev.off()

# Create the scatter plot with regression line (red and blue)
scatter_lm_plot <- ggplot(data = dataset, aes(x = x, y = y)) +
  geom_point(color = 'red') +
  geom_line(aes(y = predict(model, newdata = dataset)), color = 'blue') +
  ggtitle('y vs x') +
  xlab('x') +
  ylab('y')

# Set up PNG output device and save the scatter plot with regression line - save the file as r_lm.png
png(file = "r_lm.png", width = 800, height = 600, res = 150)
print(scatter_lm_plot)
dev.off()

# Display the summary of the regression model
summary_output <- summary(model)
print(summary_output)



