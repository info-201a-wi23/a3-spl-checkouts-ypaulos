library(ggplot2)
library(dplyr)
library(scales)
library(stringr)
# calculate trevor noah's checkouts over time
all_checkouts <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)


noah_df <- all_checkouts %>% filter(str_detect(all_checkouts$Creator, "Trevor Noah"))
noah_per_month <- noah_df %>%
  group_by(CheckoutMonth) %>%
  summarize(total_checkouts = sum(Checkouts))

x_values <- seq(1, 3)
y_values <- seq(1,3)

ggplot(data = noah_per_month) +
  geom_line(aes(x = CheckoutMonth,
                y= total_checkouts)) +
  labs(title = "Trevor Noah Checkouts", y = "Checkouts", x = "Time")
