

library(rtables)

# N = xx
lyt <- basic_table(show_colcounts = TRUE) |>
  split_cols_by("ARM") |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl)


# control N values
# this is useful e.g. for adverse events tables build_table(lyt, ADAE, alt_counts_df = ADSL)

alt_adsl <- data.frame(
  ARM = factor(c("A: Drug X", "B: Placebo", "C: Combination", "C: Combination")),
  VAL = c(1, 2, 3, 4)
)

alt_adsl

build_table(lyt, ex_adsl, alt_counts_df = alt_adsl)


ex_adsl2 <- ex_adsl
ex_adsl2$arm_labs <- c("Our Drug", "Fake Drug", "Both")[ex_adsl2$ARM]
# Name vs. labels ----
lyt <- basic_table(show_colcounts = TRUE) |>
  split_cols_by("ARM", labels_var = "arm_labs") |>
  analyze("AGE", mean, format = "xx.xx")

tbl <- build_table(lyt, ex_adsl2)

## Notice the real values appear in the paths, NOT our labels
col_paths(tbl)


