# Filter data for the 2016 presidential election
plot_data <- reduced_polls_filtered %>%
  filter(grepl("Pres", race_state), year == 2016) %>%
  mutate(state = reorder(state, mean_spread, mean))  # Reorder states by mean_spread

# Plot mean spread with confidence intervals and actual results
ggplot(plot_data, aes(x = state, y = mean_spread)) +
  geom_point() +  # Point estimates (mean_spread)
  geom_errorbar(aes(ymin = ci_lower, ymax = ci_upper), colour = "black", width = 0.8) +  # Confidence intervals
  geom_point(aes(y = mean_spread_act), color = "red") +  # Actual results in red
  theme_classic() +  # Classic theme
  theme(axis.text.x = element_text(angle = -90, vjust = 0.5)) +  # Rotate x-axis labels
  ylab("Republican - Democrat Spread") +  # Y-axis label
  ggtitle("2016 Presidential Election: Polls (Black) vs Actual Results (Red)") +  # Title
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey")  # Horizontal line at y = 0
