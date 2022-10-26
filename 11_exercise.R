## In this exercise:
## create the tables with the same faceting structure as each ggplot2 
## faceted plot by replacing 'xxx' with the appropriate rtables function
library(ggplot2)
library(rtables)

## plot 1
ggplot(ex_adsl, mapping = aes(x = AGE)) +
    geom_boxplot() +
  facet_grid(cols = vars(ARM))

lyt <- basic_table() |>
  xxx("ARM") |>
  analyze("AGE", range, format = "xx.xx - xx.xx")

build_table(lyt, ex_adsl)

## plot 2
ggplot(ex_adsl, mapping = aes(x = AGE)) +
    geom_boxplot() +
  facet_grid(rows = vars(SEX))


lyt2 <- basic_table() |>
  xxx("SEX") |>
  analyze("AGE", range, format = "xx.xx - xx.xx")

build_table(lyt2, ex_adsl)

## plot 3
ggplot(ex_adsl, mapping = aes(x = AGE)) +
    geom_boxplot() +
  facet_grid(rows = vars(SEX), cols = vars(ARM))


lyt3 <- basic_table() |>
  xxx("ARM") |>
  xxx("SEX") |>
  analyze("AGE", range, format = "xx.xx - xx.xx")

build_table(lyt3, ex_adsl)
