library(dplyr)
answer01 <- select(starwars, name, gender, homeworld)
answer02 <- select(starwars, contains("e"))
answer03 <- starwars |> slice(5:10)
answer04 <- starwars |>
  + select(name, mass, species, gender) |>
  + filter(gender == "masculine")
answer05 <- starwars |>
  + select(name, mass, species, gender) |>
  + filter(gender == "feminine | mass >= 50")
answer06 <- starwars |>
  + select(name, mass, species, gender) |>
  + filter(gender == "feminine" & (mass > 50 | mass < 40))
answer07 <-  starwars |>
  + select(name, gender, hair_color, homeworld) |>
  + filter(hair_color == "blonde" & homeworld == "Tatooine")
answer08 <- starwars |>
  + select(name, mass, height) |>
  + mutate(mass_lbs = mass*2.20462)
answer09 <- starwars |>
  + select(name, mass, height) |>
  + slice(1:5) |>
  + mutate(massweightratio = mass / height) |>
  + arrange(desc(mass), height)
answer10 <- starwars |>
  + summarize(avg_weight = mean(mass, na.rm  = TRUE))

