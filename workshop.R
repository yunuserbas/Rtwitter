


install.packages("rtweet")
install.packages("tidyverse")

library(rtweet)
library(tidyverse)

auth_setup_default()

himars_data <- search_tweets("HIMARS", n = 1500, include_rts = FALSE)

himars_data_clean <- cbind(himars_data, users_data(himars_data)[,c("id", "id_str", "name", "screen_name")])

himars_data_clean <- himars_data_clean[,!duplicated(colnames(himars_data_clean))]



