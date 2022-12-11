

install.packages("rtweet")
install.packages("tidyverse")

library(rtweet)
library(tidyverse)

auth_setup_default()

himars_data <- search_tweets("HIMARS", n = 250, include_rts = FALSE)
