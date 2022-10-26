
## For This Exercise:
##  - Add title, subtitle, main footer, and provenance footer entries


library(rtables)


vars <- names(ex_adsl)[!grepl("(ID|DT|ARM|study_duration)", names(ex_adsl))]
lyt <- basic_table(
  title = "",
  subtitles = c(
    "",
    ""
  ),
  main_footer = "",
  prov_footer = c(
    "",
    paste("Data Hash:", digest::digest(ex_adsl))
  ),
  show_colcounts = TRUE
) |>
  split_cols_by("ARM",split_fun = add_overall_level(first = FALSE, label = "All Patients")) |>
  analyze(vars, section_div = " ", var_labels = var_labels(ex_adsl[, vars]))

tbl <- build_table(lyt, ex_adsl)

print(tbl)
