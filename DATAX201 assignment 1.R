###Question 1
install.packages("tidyverse")
library("tidyverse")
install.packages("readxl")
library("readxl")
legosale_data <- read.csv("lego_sales.csv")
str(legosale_data)

# create revenue variable
legosale_data$revenue <- legosale_data$us_price * legosale_data$quantity
# total revenue by theme
revenue_theme <- legosale_data %>% # %>$ = and then
  group_by(theme) %>%
  summarize(total_revenue = sum(revenue, na.rm = TRUE))
# view results
revenue_theme
# find max revenue theme
revenue_theme[which.max(revenue_theme$total_revenue), ]

# filter Star Wars
starwars_data <- legosale_data[legosale_data$theme == "Star Wars", ]
# summarize quantity by subtheme
subtheme_summary <- starwars_data %>%
  group_by(subtheme) %>%
  summarize(total_quantity = sum(quantity, na.rm = TRUE))
# create barplot #used chat to make barplot fit correctly
par(mar = c(10, 4, 4, 2))
barplot(subtheme_summary$total_quantity,
        names.arg = subtheme_summary$subtheme,
        las = 2, # rotate labels
        col = "lightpink",
        main = "Star Wars Subtheme Sales",
        ylab = "Quantity Sold",
        cex.names = 0.8)

### Question 2
install.packages("gapminder")
library("gapminder")

#load data
data("gapminder")
#view data
gapminder

#range of years in data
range(gapminder$year)

#only recent data (2000-2026)
gap_recent <- gapminder[gapminder$year >= 2000, ]

#summary table
summary_table <- gap_recent %>%
  group_by(continent) %>%
  summarize(
    mean_lifeExp = mean(lifeExp, na.rm = TRUE),
    max_gdpPercap = max(gdpPercap, na.rm = TRUE),
    total_pop = sum(pop, na.rm = TRUE)
  )
summary_table

#get top 4 four continents
top4 <- summary_table %>%
  arrange(desc(total_pop)) %>% #desc = descending order
  head(4)

top4_names <- top4$continent

##used chat to help make plot
# filter dataset
gap_top4 <- gap_recent[gap_recent$continent %in% top4_names, ]

# split data 
c1 <- gap_top4[gap_top4$continent == top4_names[1], ]
c2 <- gap_top4[gap_top4$continent == top4_names[2], ]
c3 <- gap_top4[gap_top4$continent == top4_names[3], ]
c4 <- gap_top4[gap_top4$continent == top4_names[4], ]

# plot layout (2x2 grid) 
par(mfrow = c(2,2), mar = c(4.5, 4.5, 3, 1))


# plot 1
plot(c1$gdpPercap, c1$lifeExp,
     main = top4_names[1],
     xlab = "GDP per Capita",
     ylab = "Life Expectancy",
     pch = 16,
     col = rgb(0, 0, 1, 0.5) ,
     cex.main = 1.2, font.main = 2)
grid(col = "lightgray", lty = 3)
abline(lm(lifeExp ~ gdpPercap, data = c1), col = "HotPink", lwd = 2)

# plot 2
plot(c2$gdpPercap, c2$lifeExp,
     main = top4_names[2],
     xlab = "GDP per Capita",
     ylab = "Life Expectancy",
     pch = 16,
     col = rgb(0, 0, 1, 0.5) ,
     cex.main = 1.2, font.main = 2)
grid(col = "lightgray", lty = 3)
abline(lm(lifeExp ~ gdpPercap, data = c2), col = "HotPink", lwd = 2)

# plot 3
plot(c3$gdpPercap, c3$lifeExp,
     main = top4_names[3],
     xlab = "GDP per Capita",
     ylab = "Life Expectancy",
     pch = 16,
     col = rgb(0, 0, 1, 0.5) ,
     cex.main = 1.2, font.main = 2)
grid(col = "lightgray", lty = 3)
abline(lm(lifeExp ~ gdpPercap, data = c3), col = "HotPink", lwd = 2)

# plot 4
plot(c4$gdpPercap, c4$lifeExp,
     main = top4_names[4],
     xlab = "GDP per Capita",
     ylab = "Life Expectancy",
     pch = 16,
     col = rgb(0, 0, 1, 0.5) ,
     cex.main = 1.2, font.main = 2)
grid(col = "lightgray", lty = 3)
abline(lm(lifeExp ~ gdpPercap, data = c4), col = "HotPink", lwd = 2)


