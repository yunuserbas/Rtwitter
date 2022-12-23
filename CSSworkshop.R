
install.packages("rtweet")
install.packages("tidyverse")

library(rtweet)
library(tidyverse)

auth_setup_default()

himars_data <- search_tweets("HIMARS", n = 1500, include_rts = FALSE)

himars_data_clean <- cbind(himars_data, users_data(himars_data)[,c("id", "id_str", "name", "screen_name")])

himars_data_clean <- himars_data_clean[,!duplicated(colnames(himars_data_clean))]

ts_plot(himars_data_clean, "15 minute") +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold")) +
  labs(x = "Time", y = "Tweet Frequency",
       title = "Frequency of HIMARS-related Tweets",
       subtitle = "Aggregated by 15-minute intervals",
       caption = "Data collected by RTWeet through REST API") 

himars_data_clean %>% count(screen_name, sort = TRUE) %>%
  mutate(screen_name = reorder(screen_name, n)) %>%
  top_n(10) %>%
  ggplot(aes(x = screen_name, y = n)) +
  geom_col(color = "red", fill = "blue") +
  labs(x = "Usernames", y = "Tweet Counts", title = "Top 10 Most Active HIMARS Accounts") +
  coord_flip()
















