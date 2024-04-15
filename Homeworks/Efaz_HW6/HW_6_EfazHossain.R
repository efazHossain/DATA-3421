getwd()
house_price<-read.csv("house_price.csv")
library(ggplot2)

# 1. Scatter plot of Size_sqm vs Price
ggplot(house_price, aes(x=Size_sqm, y=Price, color=Location))+
    geom_point() + labs(x='Size (sqm)', y='Price (USD)', 
                        title='House Price vs Size') +
                        theme_minimal()

# 2. Plot Age_years versus Price and add regression line
ggplot(house_price, aes(x = Age_years, y = Price)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") + # Add regression line
  labs(x = "Age (years)", y = "Price (USD)", title = "House Price vs. Age") +
  theme_minimal()
# It seems that there is a inverse relationship with Price and Age
# this implies that as house age increases, the price likely will decrease

# 3. Modify scatterplot of Size vs Price
ggplot(house_price, aes(x = Size_sqm, y = Price, color = Location)) +
  geom_point(size = 3, color = "red") +  # Set larger point size and different color
  labs(x = "Size (sqm)", y = "Price (USD)", title = "House Price vs. Size") +
  theme_minimal() +  # Set plot theme
  theme(
    plot.title = element_text(size = 14, face = "bold"),  # Adjust title size and style
    axis.title.x = element_text(size = 12),  # Adjust x-axis label size
    axis.title.y = element_text(size = 12)   # Adjust y-axis label size
  )

# 4. Create a bar chart showing price for each Location
avg_price <- aggregate(Price ~ Location, data = house_price, FUN = mean)
ggplot(avg_price, aes(x = Location, y = Price)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(x = "Location", y = "Average Price (USD)", title = "Average House Price by Location") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotate x-axis labels for better readability

# 5. Plot a histogram of Price and adjust bins to appropriately display the distribution
ggplot(house_price, aes(x = Price)) +
  geom_histogram(binwidth = 50000, fill = "lightblue", color = "black", alpha = 0.8) +
  labs(x = "Price (USD)", y = "Frequency", title = "Distribution of House Prices") +
  theme_minimal()

# 6. Density plot on top of the histogram for Size and adjust transparency
ggplot(house_price, aes(x = Size_sqm)) +
  geom_histogram(binwidth = 10, fill = "lightblue", color = "black", alpha = 0.5) +
  geom_density(color = "red", size = 1, alpha = 0.5) +  # Overlay density plot
  labs(x = "Size (sqm)", y = "Density", title = "Distribution of House Sizes") +
  theme_minimal()

# 7. Create a bar plot that shows the count of houses by Condition. Customize the colors of the bars
ggplot(house_price, aes(x = Condition)) +
  geom_bar(fill = c("#FF9999", "#66CCCC", "#FFCC66", "#99CC99"), color = "black") +
  labs(x = "Condition", y = "Count", title = "Count of Houses by Condition") +
  theme_minimal()

# 8. Use facet_wrap() to create a scatter plot of Size_sqm vs Price for each Location in separate panels
ggplot(house_price, aes(x = Size_sqm, y = Price)) +
  geom_point() +
  facet_wrap(~ Location, scales = "free") +
  labs(x = "Size (sqm)", y = "Price (USD)", title = "House Price vs. Size by Location") +
  theme_minimal()

# 9. Perform linear regression with Price as the dependent var and Size_sqm/Bedrooms/Bathrooms/Age_years as independent variables
lm_model <- lm(Price ~ Size_sqm + Bedrooms + Bathrooms + Age_years, data = house_price)
summary(lm_model)

# 10. Extend to include Distance_to_city_center_km
lm_model_extended <- lm(Price ~ Size_sqm + Bedrooms + Bathrooms + Age_years + Distance_to_city_center_km, data = house_price)
summary(lm_model_extended)