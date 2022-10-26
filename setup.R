cran_pkgs <- c(
  "htmltools", "magrittr", "stats", "broom", "car", "checkmate",
  "cowplot", "dplyr", "emmeans", "forcats", "ggplot2", "gridExtra", 
  "gtable", "labeling", "lifecycle", "Rdpack", "rlang", "scales",
  "survival", "tibble", "tidyr", "r2rtf"
)

install.packages(cran_pkgs)

remotes::install_github("insightsengineering/formatters")
remotes::install_github("Roche/rtables")
remotes::install_github("insightsengineering/tern")
