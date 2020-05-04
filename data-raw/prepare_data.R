# Prepare data
# Store springer.csv in foder data/

prepare_data <- function() {
  list_df <- read.csv("data/springer.csv", header = TRUE)
  save(list_df, file = "springer_ebooks.RData")
}
