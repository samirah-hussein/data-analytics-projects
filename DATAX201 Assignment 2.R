library(tidyverse)

# Import datasets
values <- read.csv("FIFA values.csv")
wages <- read.csv("FIFA wages.csv")

# Inspect first few rows of each dataset
head(values)
head(wages)

# Create new variables in values dataset
values <- values %>%
  mutate(
    # convert value multiplier (M, K, 0) into numeric form
    value_mult_num = case_when(
      value_mult == "M" ~ 1000000,
      value_mult == "K" ~ 100000,
      value_mult == "0" ~ 0,
      TRUE ~ NA_real_
    ),
    
    # calculate actual player value
    value_numeric = value * value_mult_num,
    
    # categorize aggression into groups (used chat to help me with some errors i made in this code)
    Aggression_cat = case_when(
      Aggression >= 0 & Aggression < 20 ~ "lowest",
      Aggression >= 20 & Aggression < 40 ~ "low",
      Aggression >= 40 & Aggression < 60 ~ "neutral",
      Aggression >= 60 & Aggression < 75 ~ "high",
      Aggression >= 75 ~ "highest",
      TRUE ~ NA_character_
    )
  )

# Create new variables in wages dataset
wages <- wages %>%
  mutate(
    # convert wage multiplier into numeric form
    wage_mult_num = case_when(
      wage_mult == "M" ~ 1000000,
      wage_mult == "K" ~ 1000,
      wage_mult == "0" ~ 0,
      TRUE ~ NA_real_
    ),
    
    # calculate actual wage
    wage_numeric = wage * wage_mult_num
  )

# Merge the two datasets using player ID (I used chat to help me with this code)
df_full <- values %>%
  inner_join(wages, by = "ID") 

# Calculate mean wage for each aggression category
mean_wages <- df_full %>%
  group_by(Aggression_cat) %>%
  summarise(mean_wage = mean(wage_numeric, na.rm = TRUE))

# Display mean wages
mean_wages

# Filter dataset for defenders only (CB, LB, RB)
defenders <- df_full %>%
  filter(Best.Position %in% c("CB", "LB", "RB"))

# View first few rows of defenders dataset
head(defenders)

# Create scatterplot of value vs wage
plot(
  x = defenders$value_numeric,
  y = defenders$wage_numeric,
  xlab = "Player Value",
  ylab = "Player Wage",
  main = "Wage vs Value for Defenders"
)
# Add regression line (trendline)
abline(lm(wage_numeric ~ value_numeric, data = defenders), col = "blue")

