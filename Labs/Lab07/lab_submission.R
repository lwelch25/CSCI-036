## ----setup, include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.height = 3, fig.width = 5)
options(tibble.width = 62)


## ---- warning = FALSE, message = FALSE-----------------------------------------------
library(tidyverse)


## ------------------------------------------------------------------------------------
who


## ------------------------------------------------------------------------------------
who |> names()


## ------------------------------------------------------------------------------------
who |>
  select(starts_with("new_sn_f")) |>
  names()


## ------------------------------------------------------------------------------------
who |>
  select(starts_with("new_sp_m")) |>
  names() -> 
  answer01


## ------------------------------------------------------------------------------------
who |>
  select(contains("newrel_")) |>
  names() -> 
  answer02


## ------------------------------------------------------------------------------------
who |>
  select(ends_with("4554")) |>
  names() -> 
  answer03


## ------------------------------------------------------------------------------------
who |>
  pivot_longer(new_sp_m014:newrel_f65, 
               names_to = "case_type", 
               values_to = "cases") ->
  who_longer


## ------------------------------------------------------------------------------------
who_longer |>
  summarize(max_cases = max(cases, na.rm = TRUE))


## ------------------------------------------------------------------------------------
who_longer |>
  summarize(total_cases = sum(cases, na.rm = TRUE)) ->
  answer04


## ------------------------------------------------------------------------------------
who_longer |>
  group_by(year) |>
  summarize(total_cases = sum(cases, na.rm = TRUE)) ->
  answer05


## ------------------------------------------------------------------------------------
who_longer |>
  group_by(country, year) |>
  summarize(total_cases = sum(cases, na.rm = TRUE)) ->
  answer06


## ------------------------------------------------------------------------------------
who_longer |>
  separate(case_type, 
           into = c("case_type", "case_type_rest"),
           sep = 6)


## ------------------------------------------------------------------------------------
who_longer |>
  separate(case_type, 
           into = c("case_type", "case_type_rest"),
           sep = 6) |>
  separate(case_type_rest, 
           into = c("underscore", "case_type_rest"),
           sep = 1) |>
  select(-underscore) |>
  separate(case_type_rest, 
           into = c("gender", "age-range"),
           sep = 1) ->
  who_separated


## ------------------------------------------------------------------------------------
who_separated |>
  group_by(year, gender) |>
  summarize(total_cases = sum(cases, na.rm = TRUE)) ->
  answer07


## ------------------------------------------------------------------------------------
pew <- read_delim("pew.txt", delim = "\t")


## ------------------------------------------------------------------------------------
pew |> head()


## ------------------------------------------------------------------------------------
pew2 <- 
  pew |>
    mutate(religion = 
      ifelse(religion == "Donâ€™t know/refused", 
             "Don't know/refused", 
             religion))


## ---- echo = FALSE-------------------------------------------------------------------
tribble(
  ~religion, ~income, ~number_surveyed,
  "Agnostic", "<$10k", 27,
  "Agnostic", "$10-20k",              34,
  "Agnostic", "$20-30k",              60,
  "Agnostic", "$30-40k",              81
)


## ------------------------------------------------------------------------------------
pew2 |>
  pivot_longer(2:11, 
               names_to = "income", 
               values_to = "number_surveyed") ->
  answer08


## ------------------------------------------------------------------------------------
answer09 <-
  answer08 |>
    summarize(total_participants = 
                sum(number_surveyed, na.rm = TRUE))


## ------------------------------------------------------------------------------------
answer10 <-
  answer08 |>
    group_by(religion) |>
    summarize(total_participants = 
                sum(number_surveyed, na.rm = TRUE))

