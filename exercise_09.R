
library(rtables)
library(dplyr)
library(ggplot2)
ex_adsl2 <- ex_adsl |>
  filter(SEX %in% c("M", "F"))


ggplot(ex_adsl2, mapping = aes(x = AGE)) +
    geom_boxplot() +
    facet_grid(cols = vars(ARM, SEX))

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_cols_by("SEX", split_fun = drop_split_levels) |>
  analyze("AGE", mean, format = "xx.xx")

tbl <- build_table(lyt, ex_adsl2)

print(tbl)
