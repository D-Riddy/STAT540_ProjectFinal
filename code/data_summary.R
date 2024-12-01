# Group and summarize polls by race_state, year, and state
reduced_polls <- polls %>%
  group_by(race_state, year, state) %>%
  summarize(
    mean_spread = mean(spread, na.rm = TRUE),        # Mean of spread
    sd_spread = sd(spread, na.rm = TRUE),            # Standard deviation of spread
    mean_spread_act = mean(spread_act, na.rm = TRUE),# Mean of actual spread
    n_polls = n()                                    # Number of polls per race
  ) %>%
  ungroup()

# Filter races with fewer than 3 polls and calculate 95% confidence intervals
reduced_polls_filtered <- reduced_polls %>%
  filter(n_polls >= 3) %>%
  mutate(
    ci_lower = mean_spread - 1.96 * (sd_spread / sqrt(n_polls)),  # Lower bound of CI
    ci_upper = mean_spread + 1.96 * (sd_spread / sqrt(n_polls))   # Upper bound of CI
  )