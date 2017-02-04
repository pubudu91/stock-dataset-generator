library(data.table)
source("utils.R")

# Folder containing individual stock quote files spanning multiple days
data_path = "modified-data/"

# Get the list of file names in $data_path
stockq = list.files(pattern = "*.csv", path = data_path)

# Append the path of the files to the file names
stockq = paste(data_path, stockq, sep = '')

sq_list = lapply(stockq, fread) # Read all the files 
squotes = rbindlist(sq_list) # Put all the data into one data table

# Filter and get only one day's worth of stock price updates
one_day_quotes = squotes[which(timestamp >= "2017-01-23 09:30" &
                      timestamp < "2017-01-24 09:30")]

write.csv(
  x = one_day_quotes,
  file = "modified-data/23/all-data_1-23.csv",
  col.names = TRUE,
  row.names = FALSE
)
