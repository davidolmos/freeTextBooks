#' @title Downloads Free Text Ebooks From Springer Website
#'
#' @description This package downloads free text ebooks from Springer based on a PDF received via WhatsApp on April 30th 2020.
#'        The Package uses a CSV data file containing all required information to download and name the files.
#'        Ebooks are available in two formats: (1) PDF (all ebooks), (2) EPUB (some ebooks).
#'        Formats can be selected by parameter "mode" ("all" -default-, "pdf", "epub")
#'        Ebooks are stored in subdirectory "output".
#'
#' @param
#'
#' @return NULL
#'
#' @examples download_ebooks(), download_ebooks(mode = "pdf"), download_ebooks(mode = "epub")
#'
#' @export

download_ebooks <- function(mode = "all") {

  library("glue")
  library("tidyverse")

  # Defines download function call using safely to capture errors (e.g. HTTP 404, Not Found) and setting binary download mode
  safe_download <- safely(~ download.file(.x , .y, mode = "wb"))

  # Read csv file with required information to download each book
  load("springer_ebooks.RData", .GlobalEnv)
  attach(list_df)

  # Perform pdf dowload
  if (mode == "all" | mode == "pdf") {

    # Creates a String of the URL Addresses
    url_pdf <- list_df$url_pdf
    url_pdf <-
    expand_grid(isbn) %>%
    glue_data("{url_pdf}")

    # Creates names for the Ebook files
    names_pdf <-
      expand_grid(isbn) %>%
      glue_data("{title} - {author} - {edition}.pdf")

    # Perform download and store ebook files
    walk2(url_pdf, names_pdf, safe_download)

  }

  # Perform epub dowload
  if (mode == "all" | mode == "epub") {

    # Creates a String of the URL Addresses
    url_epub <- list_df$url_epub
    url_epub <-
    expand_grid(isbn) %>%
    glue_data("{url_epub}")

    # Creates names for the Ebook files
    names_epub <-
      expand_grid(isbn) %>%
      glue_data("{title} - {author} - {edition}.epub")

    # Perform download and store ebook files
    walk2(url_epub, names_epub, safe_download)

  }

}
