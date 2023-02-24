library(dplyr)
library(stringr)
library(ggplot2)

# reading in dataset
all_checkouts <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# calculate author with most checkouts from one book

pop_author_row <- all_checkouts %>% filter(Checkouts == max(Checkouts))
pop_author <- pop_author_row %>% select(Creator)

# calculate most popular material type 
pop_materials <- all_checkouts %>% select(MaterialType, Checkouts) %>% 
  group_by(MaterialType) %>% summarize(total_checkouts = sum(Checkouts)) %>% arrange(-total_checkouts) %>% slice_head(n = 1)

# calculate book with most checkouts
pop_book_row <- all_checkouts %>% filter(Checkouts == max(Checkouts))
pop_book <- pop_book_row %>% select(Title)

# which is more common, physical or digital?

physical_digital <- all_checkouts %>% select(UsageClass, Checkouts) %>% group_by(UsageClass) %>% summarize(total_checkouts = sum(Checkouts)) %>% slice_head(n = 1)

# book checkouts per month
books_per_month_df <- all_checkouts %>% filter(MaterialType == "BOOK") %>% select(CheckoutMonth, Checkouts) %>% group_by(CheckoutMonth) %>% summarize(total_checkouts = sum(Checkouts))
most_pop_book_month <- books_per_month_df %>% filter(total_checkouts == max(total_checkouts)) %>% pull(CheckoutMonth)


