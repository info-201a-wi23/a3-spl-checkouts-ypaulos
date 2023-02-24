library(ggplot2)
library(dplyr)
library(scales)
# reading in dataset
all_checkouts <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

books_per_month_df <- all_checkouts %>% filter(MaterialType == "BOOK") %>%
  select(CheckoutMonth, Checkouts) %>% group_by(CheckoutMonth) %>% summarize(total_checkouts = sum(Checkouts))
most_pop_book_month <- books_per_month_df %>% filter(total_checkouts == max(total_checkouts)) %>% pull(CheckoutMonth)



ggplot(data = books_per_month_df) +
  geom_line(aes(x = books_per_month_df$CheckoutMonth, y = books_per_month_df$total_checkouts)) + labs(title = "Book Checkouts per month", x = "Months", y = "Checkouts")

