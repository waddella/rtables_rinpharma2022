
library(ggplot2)

ggplot(ex_adsl, mapping = aes(x = AGE)) +
    geom_boxplot() +
  facet_grid(cols = vars(ARM))



library(rtables)

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze("AGE", range, format = "xx.xx - xx.xx")

build_table(lyt, ex_adsl)

ggplot(ex_adsl, mapping = aes(x = AGE)) +
    geom_boxplot() +
  facet_grid(rows = vars(SEX))


ggplot(ex_adsl, mapping = aes(x = AGE)) +
  geom_boxplot() +
  facet_grid(rows = vars(ARM))


lyt2 <- basic_table() |>
  split_rows_by("SEX") |>
  analyze("AGE", range, format = "xx.xx - xx.xx")

build_table(lyt2, ex_adsl)


ggplot(ex_adsl, mapping = aes(x = AGE)) +
    geom_boxplot() +
  facet_grid(rows = vars(SEX), cols = vars(ARM))


lyt3 <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |>
  analyze("AGE", range, format = "xx.xx - xx.xx")

build_table(lyt3, ex_adsl)
