
library(rtables)
library(dplyr)

ex_adsl3 <- ex_adsl |>
  mutate(B1HL = factor(ifelse(BMRKR1 > mean(BMRKR1), "H", "L"), levels = c("L", "H")))

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_cols_by("B1HL") |>
  split_rows_by("SEX") |>
  analyze("AGE", function(x) "")

tbl <- build_table(lyt, ex_adsl3)

dim(tbl)
ncol(tbl)
nrow(tbl)

table_structure(tbl, detail = "row")
col_paths_summary(tbl)
row_paths_summary(tbl)
