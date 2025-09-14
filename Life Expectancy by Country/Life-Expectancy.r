# load packages
library(ggplot2)
library(readr)
library(dplyr)


# import and inspect data
data <- read_csv("country_data.csv")
print(head(data))

# life expectancy

life_expectancy <- data %>% pull(life_expectancy)
# print(life_expectancy)

# life expectancy quartiles
life_expectancy_quartiles <- quantile(life_expectancy, c(.25, .5, .75))
# print(life_expectancy_quartiles)

# plot histogram of life expectancy
hist(life_expectancy)

# gdp
gdp <- data %>% pull(GDP)

# print(gdp)

# median gdp
median_gdp <- median(gdp)
# print(median_gdp)

# low gdp
low_gdp <- data %>%  filter(GDP <= median_gdp)

# high gdp
high_gdp <- data %>% filter(GDP > median_gdp)


# low gdp quartiles

lev_low_gdp <- data %>% filter(GDP <= median_gdp) %>% pull(life_expectancy)
# print(lev_low_gdp)

# high gdp quartiles

lev_high_gdp <- data %>% filter(GDP > median_gdp) %>% pull(life_expectancy)

# generate and export plots
png("hist_low_gdp.png", 1000, 700)
hist(lev_low_gdp, col = 'red')
dev.off()

png("hist_high_gdp.png", 1000, 700)
hist(lev_high_gdp, col = 'blue')
dev.off()

png("hist_life_expectancy.png", 1000, 700)
hist(life_expectancy, col = 'purple')
dev.off()