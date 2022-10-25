
# TODO:
#  - Use variable labels
#  - row gaps
#  - 

library(rtables)

lyt <- basic_table(
  title = "Demographic Table all Patients",
  subtitles = c(
    "Protocol: ABC,  Cutoff Date: June 5, 2022",
    "Note the data is synthetic."
  ),
  main_footer = "Data has been generated with the random.cdisc.data package.",
  prov_footer = c(
    "File: rtables_rinpharma2022/exercise_02.R"
  )
) |>
  split_cols_by("ARM", split_fun = add_overall_level(first = FALSE, label = "All Patients")) |>
  add_colcounts() |>
  analyze(c("AGE", "SEX", "COUNTRY", "BMRKR1", "BMRKR2"))

tbl <- build_table(lyt, ex_adsl)

print(tbl)
