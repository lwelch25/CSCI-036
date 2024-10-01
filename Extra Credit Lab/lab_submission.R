## ----setup, include=FALSE------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.height = 3, fig.width = 5)
options(tibble.width = 62)


## ---- warning = FALSE, message = FALSE-----------------------
library(dplyr)
library(tibble)
library(knitr)


## ------------------------------------------------------------
mean(c(5, 3, 5))


## ------------------------------------------------------------
ec1 <- tibble(
  color = c("blue", "red", "red"),
  reflect = c(5, 3, 5),
  lighting = c(5, 12, 11)
)


## ------------------------------------------------------------
ec1 |>
  summarize(mean_reflect = mean(reflect))


## ------------------------------------------------------------
ec1 |>
  summarize(mean(reflect))


## ------------------------------------------------------------
ec1 |>
  summarize(mean_reflect = mean(reflect),
            median_reflect = median(reflect),
            median_cross = median(lighting))


## ------------------------------------------------------------
answer01 <- 1


## ------------------------------------------------------------
answer02 <- 2 


## ------------------------------------------------------------
ec1 |> kable()


## ---- echo = FALSE-------------------------------------------
ec1 |> filter(color == "blue") |> kable()


## ---- echo = FALSE-------------------------------------------
ec1 |> filter(color == "red") |> kable()


## ------------------------------------------------------------
ec1 |>
  group_by(color) |>
  kable()


## ------------------------------------------------------------
ec1 |>
  filter(color == "blue") |>
  summarize(mean_reflect = mean(reflect),
            median_reflect = median(reflect),
            median_cross = median(lighting))


## ------------------------------------------------------------
ec1 |>
  filter(color == "blue") |>
  summarize(mean_reflect = mean(reflect),
            median_reflect = median(reflect),
            median_cross = median(lighting)) |>
  mutate("color" = "blue", .before = 1)


## ------------------------------------------------------------
ec1 |>
  filter(color == "red") |>
  summarize(mean_reflect = mean(reflect),
            median_reflect = median(reflect),
            median_cross = median(lighting)) |>
  mutate("color" = "red", .before = 1)


## ------------------------------------------------------------
union(
  ec1 |>
    filter(color == "blue") |>
    summarize(mean_reflect = mean(reflect),
              median_reflect = median(reflect),
              median_cross = median(lighting)) |>
    mutate("color" = "blue", .before = 1),
  ec1 |>
    filter(color == "red") |>
    summarize(mean_reflect = mean(reflect),
              median_reflect = median(reflect),
              median_cross = median(lighting)) |>
    mutate("color" = "red", .before = 1)
) |> kable()


## ------------------------------------------------------------
ec1 |>
  group_by(color) |>
  summarize(mean_reflect = mean(reflect),
            median_reflect = median(reflect),
            median_cross = median(lighting)) |> 
  kable()


## ------------------------------------------------------------
answer03 <- 12


## ------------------------------------------------------------
answer04 <- 3


## ------------------------------------------------------------
answer05 <- iris |>
  group_by(Species) |>
  summarize(a = mean(Sepal.Length),
            b = mean(Petal.Length))

