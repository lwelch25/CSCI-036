library(ggplot2)
g1 <- 
  midwest |>
  ggplot(aes(x = area, y = poptotal)) +
  geom_point(aes(col = state, size = popdensity))
answer01 <- g1 +
  labs(title = "County Populations")
answer02 <- g1 +
  labs(
       y = "Population count", 
       x = "Area of County")
answer03 <- g1 +
  labs(caption = "Source: midwest dataset in R")
answer04 <- 5
answer05 <- 7
answer06 <- 3
answer07 <- 6
answer08 <- g1 + theme_linedraw()
answer09 <- g1 + theme(aspect.ratio = 4/3)
answer10 <- g1 + theme(legend.position="left")
