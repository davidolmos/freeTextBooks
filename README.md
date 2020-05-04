# freeTextBooks
This package downloads free text ebooks from Springer

Description:
This package downloads free text ebooks from Springer based on a PDF received via WhatsApp on April 30th 2020.
       The Package uses a data file containing all required information to download and name the files.
       Ebooks are available in two formats: (1) PDF (all ebooks), (2) EPUB (some ebooks).
       Formats can be selected by parameter "mode" ("all" -default-, "pdf", "epub")
       Ebooks are stored in the working directory.

Examples:
# Download ebooks in both formats, "pdf" and "epub"
download_ebooks()
# Download ebooks in "pdf" format only
download_ebooks(mode = "pdf")
# Download ebooks in "epub" format only
download_ebooks(mode = "epub")
