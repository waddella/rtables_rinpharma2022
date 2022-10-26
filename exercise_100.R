
library(rtables)
library(tern)
library(dplyr)

vars <- c("RACE", "SEX", "STRATA1", "STRATA2")
var_lbls <- var_labels(ex_adsl)[vars]

lyt <- basic_table(show_colcounts = TRUE) |>
  split_cols_by(var = "ARM", split_fun = add_overall_level("All Patients")) |>
  summarize_vars(vars, var_labels = var_lbls)

build_table(lyt, ex_adsl)

ex_adsl_USA <- ex_adsl |>
  filter(COUNTRY == "USA")

build_table(lyt, ex_adsl_USA)
