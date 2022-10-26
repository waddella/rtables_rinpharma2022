
# Create an adverse events table

library(rtables)
library(dplyr)

head(ex_adae[, c("USUBJID", "AEBODSYS", "AEDECOD")])

ex_adae2 <- ex_adae |>
  mutate(
    AEBODSYS = sub("cl", "sys", AEBODSYS),
    AEDECOD = sub("dcd", "code", AEDECOD)
  )

s_events_patients <- function(x, labelstr, .N_col) {
  in_rows(
    "Total number of patients with at least one event" =
      rcell(length(unique(x)) * c(1, 1 / .N_col), format = "xx (xx.xx%)"),
    
    "Total number of events" = rcell(length(x), format = "xx")
  )
}

s_events_patients(x = c("id 1", "id 1", "id 2"), .N_col = 5)

lyt <- basic_table() %>%
  split_cols_by("ARM", split_fun = add_overall_level("All Patients")) %>%
  add_colcounts() %>%
  summarize_row_groups("USUBJID", cfun = s_events_patients) %>%
  split_rows_by("AEBODSYS", child_labels = "visible", indent_mod = 1)  %>%
  summarize_row_groups("USUBJID", cfun = s_events_patients) %>%
  analyze("AEDECOD", afun = list_wrap_x(table), indent_mod = -1)

tbl <- build_table(lyt, ex_adae2, alt_counts_df = ex_adsl)

tbl

## TODO: fix indenting

## remove (prune) rows with all zero counts

## TODO

## sort highest count

# TODO
