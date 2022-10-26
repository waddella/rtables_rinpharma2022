
library(rtables)

lyt <- basic_table(show_colcounts = TRUE) |>
  split_cols_by("ARM", split_fun = add_overall_level("All Patients", first = FALSE)) |>
  analyze("EOSSTT", function(x, .N_col) {
    in_rows(
      "Completed Study" = (sum(x == "COMPLETED") * c(1, 1/.N_col)),
      .formats = "xx (xx.xx%)"
    )
  }) |>
  split_rows_by("EOSSTT", split_fun = keep_split_levels("DISCONTINUED")) |>
  summarize_row_groups(label_fstr = "Discontinued Study") |>
  analyze("DCSREAS", function(x, .N_col) {
    lst <- as.list(table(x))
    in_rows(
      .list = lapply(lst, \(y) rcell(y * c(1, 1/.N_col), format = "xx (xx.xx%)"))
    )
  })

tbl <- build_table(lyt, ex_adsl)
tbl
