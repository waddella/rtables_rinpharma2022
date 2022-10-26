
# Create a basic adverse events table ----

library(rtables)
library(dplyr)

head(ex_adae[, c("USUBJID", "AEBODSYS", "AEDECOD")])

ex_adae2 <- ex_adae |>
  mutate(
    AEBODSYS = factor(sub("cl", "sys", AEBODSYS)),
    AEDECOD = factor(sub("dcd", "code", AEDECOD))
  )

s_events_patients <- function(x, labelstr, .N_col) {
  in_rows(
    "Total number of patients with at least one event" =
      rcell(length(unique(x)) * c(1, 1 / .N_col), format = "xx (xx.xx%)"),

    "Total number of events" = rcell(length(x), format = "xx")
  )
}

s_events_patients(x = c("id 1", "id 1", "id 2"), .N_col = 5)

lyt <- basic_table() |>
  split_cols_by("ARM", split_fun = add_overall_level("All Patients")) |>
  add_colcounts() |>
  summarize_row_groups("USUBJID", cfun = s_events_patients) |>
  split_rows_by("AEBODSYS", child_labels = "visible", indent_mod = 1)  |>
  summarize_row_groups("USUBJID", cfun = s_events_patients) |>
  analyze("AEDECOD", afun = \(x) as.list(table(x)), indent_mod = -1)

tbl <- build_table(lyt, ex_adae2, alt_counts_df = ex_adsl)

tbl

## remove (prune) rows with all zero counts
trim_zero_rows(tbl)



## Adverse Events by Grade Table ----
## sort highest count

table_count_grade_once_per_id <- function(df,
                                          labelstr = "",
                                          gradevar = "AETOXGR",
                                          idvar = "USUBJID",
                                          grade_levels = NULL) {
    id <- df[[idvar]]
    grade <- df[[gradevar]]

    if (!is.null(grade_levels)) {
        stopifnot(all(grade %in% grade_levels))
        grade <- factor(grade, levels = grade_levels)
    }

    id_sel <- !duplicated(id)

    in_rows(
        "--Any Grade--" = sum(id_sel),
        .list =  as.list(table(grade[id_sel]))
    )
}


lyt <- basic_table() |>
    split_cols_by("ARM") |>
    add_colcounts() |>
    analyze("USUBJID", afun = s_events_patients, show_labels = "hidden") |>
    split_rows_by("AEBODSYS", split_fun = add_overall_level("- Any adverse events - "), child_labels = "visible") |>
    summarize_row_groups(cfun = table_count_grade_once_per_id, format = "xx", indent_mod = 0) |>
    split_rows_by("AEDECOD", split_fun = drop_split_levels, child_labels = "visible", indent_mod = -1, section_div = " ")  |>
    analyze("AETOXGR",
            afun = table_count_grade_once_per_id,
            extra_args = list(grade_levels = 1:5), show_labels = "hidden")

tbl <- build_table(lyt, ex_adae, alt_counts_df = ex_adsl)

tbl
