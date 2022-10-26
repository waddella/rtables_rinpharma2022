
library(rtables)
library(dplyr)

# Default split function NULL ----
# splits by factor levels

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl)


# Documentation ----
# of existing split functions
?drop_split_levels


# Reorder Levels ----
# (instead of changing the factor levels with fct_relevel)
lyt <- basic_table() |>
  split_cols_by(
    var = "ARM",
    split_fun = reorder_split_levels(c("B: Placebo", "A: Drug X", "C: Combination"))
  ) |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl)

# Add overall column ----
lyt <- basic_table() |>
  split_cols_by("ARM", split_fun = add_overall_level()) |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl)

## move Overall to last column
lyt <- basic_table() |>
  split_cols_by("ARM", split_fun = add_overall_level(first = FALSE)) |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl)

## overall in nested
## move Overall to last column
ex_adsl2 <- ex_adsl |>
  filter(SEX %in% c("M", "F")) |>
  mutate(SEX = droplevels(SEX))

lyt <- basic_table() |>
  split_cols_by("ARM", split_fun = add_overall_level(first = FALSE)) |>
  split_cols_by("SEX") |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl2)

## or overall for each ARM
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_cols_by("SEX", split_fun = add_overall_level(first = FALSE)) |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl2)

## or both
lyt <- basic_table() |>
  split_cols_by("ARM", split_fun = add_overall_level(first = FALSE)) |>
  split_cols_by("SEX", split_fun = add_overall_level(first = FALSE)) |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl2)

## or only one overall column not nested
## TODO
lyt <- basic_table() |>
  split_cols_by("ARM") |>
  split_cols_by("SEX") |>
  analyze("AGE", mean, format = "xx.xx")
build_table(lyt, ex_adsl2)

#          A: Drug X      B: Placebo      C: Combination       Overall
#          F       M       F       M        F         M   
# ————————————————————————————————————————————————————————------------
# mean   32.76   35.57   34.12   37.44    35.20     35.38      34.88

# Other split functions ----
# TODO

