
# Create an adverse events table

library(rtables)

s_events_patients <- function(x, labelstr, .N_col) {
  in_rows(
    "Total number of patients with at least one event" =
      rcell(length(unique(x)) * c(1, 1 / .N_col), format = "xx (xx.xx%)"),
    
    "Total number of events" = rcell(length(x), format = "xx")
  )
}

s_events_patients(x = c("id 1", "id 1", "id 2"), .N_col = 5)

lyt <- basic_table() %>%
  split_cols_by("ARM") %>%
  add_colcounts() %>%
  split_rows_by("AEBODSYS", child_labels = "visible", indent_mod = 1)  %>%
  summarize_row_groups("USUBJID", cfun = s_events_patients) %>%
  analyze("AEDECOD", afun = list_wrap_x(table), indent_mod = -1)

tbl <- build_table(ex_adae, alt_counts_df = ex_adsl)

tbl
tbl1