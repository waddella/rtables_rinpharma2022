library(rtables)

a_count_percentage2 <- function(x, .N_col, denom = c("N", "n")) {
  denom <- match.arg(denom, several.ok = FALSE)
  
  n <- sum(!is.na(x))
  counts <- table(x)
  
  denominator <- if (denom == "N") .N_col else n
  
  count_percentages <- lapply(counts, \(cnt) rcell(cnt * c(1, 1/denominator), format = "xx (xx.xx%)"))
  in_rows(.list = append(list("n" = rcell(n, "xx")), count_percentages))
}

lyt <- basic_table() |>
  split_cols_by("ARM") |>
  analyze(c("SEX", "RACE"), afun = a_count_percentage2)

build_table(lyt, ex_adsl)
