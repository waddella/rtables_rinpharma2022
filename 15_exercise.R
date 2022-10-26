

library(rtables)

help("custom_split_funs")

# look at an actual implementation
remove_split_levels # TODO: choose the simplest one


# No split ---
dont_split <- function(df, spl, vals, labels = NULL) {
    
}

lyt <- basic_table() |>
  split_cols_by("ARM", split_fun = dont_split) |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl)


# Split cont. variable win histogram bins

# this is called a closure (http://adv-r.had.co.nz/Functional-programming.html#closures)
split_hist_bins <- function(breaks) {
  function(df, spl, vals, labels = NULL) {
    brks <- hist(df[[varname]], breaks = breaks, plot = FALSE)
    # TODO
  }
}

lyt <- basic_table() |>
  split_cols_by("ARM", split_fun = dont_split) |>
  analyze("AGE", mean, format = "xx.xx")

build_table(lyt, ex_adsl)


# Biomarker Evaluable Population vs All
#

# TODO

#      A             B    
#    BEP  ALL    BEP  All
# ------------------------

