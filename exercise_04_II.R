
library(rtables)
library(tern)

vars <- names(ex_adsl)[!grepl("(ID|DT|ARM|study_duration)", names(ex_adsl))]
var_lbls <- var_labels(ex_adsl)[vars]

lyt <- basic_table() |>
  split_cols_by(var = "ARM", split_fun = add_overall_level("All Patients")) |>
  summarize_vars(
    vars = vars,
    var_labels = var_lbls
  )

tbl <- build_table(lyt, ex_adsl)

print(tbl)
