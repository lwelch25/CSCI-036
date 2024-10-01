library(readr)
r1 <- "Height,Weight\n72,210\n67,155"
answer01 <- read_csv(r1)
r2 <- "Height&Weight\n72&210\n67&155"
answer02 <- read_csv(r2)
answer03 <- 11042
library(dplyr)
answer04 <- read_csv("vgsalesGlobalemod.csv", skip = 3) |>
  filter(Platform == "NES") |>
  select(Rank, Name, Platform, Year) 
answer05 <- read_csv("vgsalesGlobalemod.csv", skip = 3) |>
  filter(Platform == "NES") |>
  select(Rank, Name, Platform, Year) |>
  arrange(Year)

answer06 <- read_csv("vgsalesGlobalemod.csv", skip = 3, col_types = 'c??????????')
answer07 <- answer06 |> arrange(Rank)
library(readxl)
answer08 <- read_excel("scf2016_tables_internal_real_historical.xlsx", 
                       na = 'n.a.', sheet = 3, skip = 3)
answer09 <- read_excel("scf2016_tables_internal_real_historical.xlsx", 
                       na = "n.a.", sheet = 2, 
                       skip = 18, 
                       n_max = 6,
                       col_names = c("Age", LETTERS[2:25]))

library(haven)
answer10 <- read_dta("census.dta")

