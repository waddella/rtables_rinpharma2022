## In This Exercise:
##  - Modify the declared layout so that the numbr of Unique RACE values, and the mean of AGE are
##    calculated within each strata (STRATA1) and separately for each arm (ARM)
library(rtables)

lyt <- basic_table() %>%
    split_cols_by_multivar(c("RACE", "AGE"), varlabels = c("Ethn. Present", "Ave. Age")) %>%
    analyze_colvars(afun = list(function(x) length(unique(x)),
                                function(x) rcell(mean(x), format = "xx.x")))

tbl <- build_table(lyt, ex_adsl)
