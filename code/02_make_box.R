here::i_am("code/02_make_box.R")

data <- readRDS(
  file = here::here("output/clean_data.rds")
)

library(ggplot2)

boxplot <- ggplot(data, aes(x = factor(HeartDisease), y= Age)) +
  geom_boxplot(fill = "steelblue", color = "black") +
  labs(
    x = "Outcome of Heart disease (1= Disease and 0= No disease)",
    y = "Age",
    title = "Distribution Age by Heart Disease"
  )

ggsave(
  here::here("output/boxplot.png"),
  plot = boxplot,
  device = "png"
)