# Subset polls to keep those ending within 6 weeks before Election Day
polls_subset <- polls %>% 
  mutate(endmonth = strftime(enddate, "%m")) %>%  # Extract month from end date
  filter(endmonth %in% c("10", "11"))  # Keep only October and November polls

# Add columns for the spread between Republican and Democratic votes
polls <- polls %>%
  mutate( spread = republican_poll - democrat_poll,  # Polling difference
    spread_act = republican_result - democrat_result  # Actual voting difference
  )