

## Printable-page type exporters (txt, pdf, rtf) support
## pagination specification in exactly the same
## way as direct calls to paginate_table does.


# Save as txt file, \n>>>>\n page separator
export_as_txt(tbl, file = "./text_output_01.txt", page_type = "a4", paginate = TRUE,
              page_break = "\n>>>>\n")

export_as_txt(tbl, file = "./text_output_02.txt", page_type = "a4", paginate = TRUE,
              landscape = TRUE, page_break = "\n>>>>\n")


# Save as pdf (note one pdf with multiple pages)

export_as_txt(tbl, file = "./pdf_output_01.pdf", page_type = "a4", paginate = TRUE,
              page_break = "\n>>>>\n")

export_as_pdf(tbl, file = "./pdf_output_02.pdf", page_type = "a4", paginate = TRUE,
              landscape = TRUE, page_break = "\n>>>>\n")


# Save as RTF

export_as_rtf(tbl, file = "./rtf_output_01.rtf", page_type = "a4", paginate = TRUE,
              page_break = "\n>>>>\n")

export_as_rtf(tbl, file = "./rtf_output_02.rtf", page_type = "a4", paginate = TRUE,
              landscape = TRUE, page_break = "\n>>>>\n")

