library(rtables)

lyt <- basic_table() %>%
    split_cols_by("ARM") %>%
    split_cols_by_multivar(c("RACE", "AGE")) %>%
    split_rows_by("STRATA1") %>%
    analyze_colvars(afun = list(function(x) length(unique(x)),
                                function(x) rcell(mean(x), format = "xx.x")))

tbl <- build_table(lyt, ex_adsl)
