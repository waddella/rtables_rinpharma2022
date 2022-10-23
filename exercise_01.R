
# Exercise R in Pharma 2022 rtables workshop

library(rtables)

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze("AGE", mean, format = "xx.xx")

tbl <- build_table(lyt, ex_adsl)

print(tbl)
