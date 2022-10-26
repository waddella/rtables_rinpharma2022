
# Group summaries

library(rtables)
library(dplyr)

ex_adsl3 <- ex_adsl |>
  mutate(B1HL = factor(ifelse(BMRKR1 > mean(BMRKR1), "H", "L"), levels = c("L", "H")))

# Stage 1
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |> 
  split_rows_by("B1HL") |>
  analyze("AGE", \(x) list(B = "-"))

build_table(lyt, ex_adsl3)

# Stage 2
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  summarize_row_groups() |>
  split_rows_by("SEX") |> 
  split_rows_by("B1HL") |>
  analyze("AGE", \(x) list(B = "a"))

build_table(lyt, ex_adsl3)

# Stage 3
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |> 
  summarize_row_groups(cfun = function(x, labelstr) {
    lst <- setNames(
      list(rcell("s", format = "xx")),
      labelstr
    )
    in_rows(.list = lst)
  }) |>
  split_rows_by("B1HL") |>
  analyze("AGE", \(x) list(B = "a"))

build_table(lyt, ex_adsl3)

# note how the root label has been lost
# TODO: why

# Stage 4
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |> 
  summarize_row_groups() |>
  split_rows_by("B1HL") |>
  analyze("AGE", \(x) list(B = "a"))

build_table(lyt, ex_adsl3)

# Stage 5
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_rows_by("SEX") |> 
  split_rows_by("B1HL") |>
  summarize_row_groups() |>
  analyze("AGE", \(x) list(B = "a"))

build_table(lyt, ex_adsl3)

# Now all together
foo <- function(str) {
  function(x, labelstr) {
    lst <- setNames(
      list(rcell(str, format = "xx")),
      labelstr
    )
    in_rows(.list = lst)
  }
}

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  summarize_row_groups(cfun = foo("r")) |>
  split_rows_by("SEX") |> 
  summarize_row_groups(cfun = foo("s")) |>
  split_rows_by("B1HL") |>
  summarize_row_groups(cfun = foo("bm")) |>
  analyze("AGE", afun = \(x) list(B = "a"))

build_table(lyt, ex_adsl3)


# Lets look at the default group summary
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  summarize_row_groups() |>
  split_rows_by("SEX") |> 
  summarize_row_groups() |>
  split_rows_by("B1HL") |>
  summarize_row_groups() |>
  analyze("AGE", afun = \(x) list(B = "a"))

build_table(lyt, ex_adsl3)


# Fix the row label for the root summary
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  summarize_row_groups(label_fstr = "all") |>
  split_rows_by("SEX") |> 
  summarize_row_groups() |>
  split_rows_by("B1HL") |>
  summarize_row_groups() |>
  analyze("AGE", afun = \(x) list(B = "a"))

build_table(lyt, ex_adsl3)


# Add summary to the row label
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  summarize_row_groups(label_fstr = "summary (all)") |>
  split_rows_by("SEX") |> 
  summarize_row_groups(label_fstr = "summary %s") |>
  split_rows_by("B1HL") |>
  summarize_row_groups(label_fstr = "summary %s") |>
  analyze("AGE", afun = \(x) list(B = "a"))

build_table(lyt, ex_adsl3)
