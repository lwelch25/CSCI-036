library(readr)
r1 <- "Height,Weight\n72,210\n67,155"
answer01 <- read_csv(r1)
r2 <- "Height&Weight\n72&210\n67&155"
answer02 <- read_csv(r2)
answer03 <- 0
library(dplyr)
answer04 <- 0
answer05 <- 0
answer06 <- 0
answer07 <- 0
library(readxl)
answer08 <- 0
answer09 <- 0
library(haven)
answer10 <- 0