# data-raw/mydataset.R
# Data import and processing pipeline
# Prepare data
# Store springer.csv in foder data/

library(readr)

list_df <- read.csv("data-raw/springer.csv", header = TRUE)

# Data processing code here...

# This should be the last line.
# Note that names are unquoted.
# I like using overwrite = T so everytime I run the script the
# updated objects are saved, but the default is overwrite = F
usethis::use_data(list_df, overwrite = T)

# saveRDS(list_df, file = "springer_ebooks.RData")
