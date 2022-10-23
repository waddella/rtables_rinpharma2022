
library(rtables)
library(dplyr)

# for illustrative purposes (smaller table)
ex_adsl3 <- ex_adsl |>
  mutate(B1HL = factor(ifelse(BMRKR1 > mean(BMRKR1), "H", "L"), levels = c("L", "H")))

View(ex_adsl3[, c("B1HL", "BMRKR1")])

# Stage 1

lyt <- basic_table()

build_table(lyt, ex_adsl3)

# Stage 2
lyt <- basic_table() |>
  split_cols_by("ARM")

build_table(lyt, ex_adsl3)

# Stage 3
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_cols_by("B1HL")

build_table(lyt, ex_adsl3)

# Stage 4
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_cols_by("B1HL") |>
  split_rows_by("SEX") |>
  analyze("AGE", function(x) "")

build_table(lyt, ex_adsl3)

# Go ahead and nest the row structure by other categorical variables

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_cols_by("B1HL") |>
  split_rows_by("SEX") |> 
  split_rows_by(        ) |>
  analyze("AGE", function(x) "")

build_table(lyt, ex_adsl3)
