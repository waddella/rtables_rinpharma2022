## In This Exerise
##  - Modify double_trouble so that the first level is the one repeated
##  - Change the text that is displayed for the column in the dont_split example to "everybody"

library(rtables)

help("custom_split_funs")



double_trouble <- function(df, spl, vals, labels, trim) {
    ret <- do_base_split(spl, df, vals = vals,
                         labels = labels, trim = trim)
    ret$datasplit <- c(ret$datasplit, tail(ret$datasplit, 1))
    ret$values <- c(ret$values, tail(ret$values, 1))
    ret$labels <- c(ret$labels, tail(ret$labels, 1))
    ret$extras <- c(ret$extras, tail(ret$extras, 1))
    ret
}

lyt <- basic_table() |>
  split_cols_by("ARM", split_fun = double_trouble) |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl)



## Most of the time, custom functions are built on top of those we provide

dont_split <- function() {
    combodf <- data.frame(valname = "ALL",
                          label = "All of them",
                          levelcombo = I(list(select_all_levels)),
                          exargs = I(list(list())),
                          stringsAsFactors = FALSE)
    add_combo_levels(combodf, trim = FALSE, first = TRUE, keep_levels = "ALL")
}

lyt2 <- basic_table() |>
  split_cols_by("ARM", split_fun = dont_split()) |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt2, ex_adsl)



