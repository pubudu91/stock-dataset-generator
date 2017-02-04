library(data.table)
source("utils.R")

data_path = "../stock-data/30-3/"
dest_path = "modified-data/30-3/"

# Add the symbol column to all the data from $data_path and write new data files at $dest_path
append_symbol(data_path = data_path, modified_path = dest_path)

# NO need to continue on if you don't need the single file with all the data.

# Combine all the data files into one data table 
quotes = combine_data(dest_path)

write.csv(
  x = quotes,
  file = "modified-data/30-3/aggr/all-data-30-3.csv",
  col.names = TRUE,
  row.names = FALSE
)
