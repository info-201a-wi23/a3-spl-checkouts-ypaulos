library(ggplot2)
library(dplyr)
library(stringr)
# compare physical and digital checkouts
# read in data
all_checkouts <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

physical_digital <- all_checkouts %>% select(UsageClass, Checkouts) %>% group_by(UsageClass) %>% 
  summarize(total_checkouts = sum(Checkouts)) 

# make graph
ggplot(data = physical_digital) +
  geom_col(aes(x = UsageClass, y = total_checkouts, fill = UsageClass)) +
scale_color_brewer(palette = "Accent") + 
  labs(title = "Physical and Digital Checkout Comparison", x = "Media Type", y = "Checkouts", fill = "Media Type")

