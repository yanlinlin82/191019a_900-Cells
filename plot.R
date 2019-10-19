library(tidyverse)

g <- expand_grid(row = 1:30, col = 1:30) %>%
  mutate(passed = (row_number() <= 37 * 12 + 5)) %>%
  ggplot(aes(x = col, y = -row)) +
  geom_tile(fill = "white", color = "black") +
  geom_text(aes(label = ifelse(passed, "X", ""))) +
  geom_text(data = tibble(x = 1:30, y = -31),
            aes(x = x, y = y, label = x)) +
  geom_text(data = tibble(x = 0, y = seq(2,30,by=2), age = seq(5,75,by=5)),
            aes(x = x, y = -y, label = age)) +
  geom_text(data = tibble(x = 31, y = 1:30),
            aes(x = x, y = -y, label = y)) +
  geom_text(data = tibble(x = 15, y = .5,
                          text = "We Have Only About 900 Months in One Life"),
            aes(x = x, y = y, label = text), cex = 7) +
  theme_void()
g %>% ggsave(filename = "plot.png", width = 8, height = 6)
