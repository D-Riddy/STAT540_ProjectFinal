# Add a bias column to the reduced_polls data frame
reduced_polls <- reduced_polls %>%
  mutate(bias = mean_spread_act - mean_spread)  # Calculate the bias term

# Plot the distribution of bias terms for each year
ggplot(reduced_polls, aes(x = factor(year), y = bias)) +
  geom_boxplot() +  # Create a boxplot for each year
  theme_classic() +  # Apply a classic theme
  xlab("Election Year") +  # Label for x-axis
  ylab("Bias (theta - hat(theta))") +  # Label for y-axis
  ggtitle("Distribution of Bias Terms by Year")  # Add a title