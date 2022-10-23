
library(rtables)
library(dplyr)

ex_adsl2 <- ex_adsl |>
  filter(SEX %in% c("M", "F"))

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_cols_by("SEX", split_fun = drop_split_levels) |>
  analyze("AGE", mean, format = "xx.xx")

tbl <- build_table(lyt, ex_adsl2)

print(tbl)


# Don't nest column splits
lyt2 <- basic_table() |>
  split_cols_by("ARM") |>
  split_cols_by("SEX", nested = FALSE, split_fun = drop_split_levels) |>
  analyze("AGE", mean, format = "xx.xx")

tbl2 <- build_table(lyt2, ex_adsl2)

print(tbl2)
