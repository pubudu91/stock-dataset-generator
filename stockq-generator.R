library(data.table)

data_path = "../stock-data/test2/"
new_path = "modified-data/"
# stockq = list.files(pattern = "*.csv", path = data_path)
# 
# for (i in 1:length(stockq)) {
#   # assign(stockq[i], fread(paste(data_path, stockq[i], sep = '')))
#   temp = fread(paste(data_path, stockq[i], sep = ''))
#   symbol = strsplit(stockq[i], "-")[[1]][1]
#   temp$symbol = symbol
#   names(temp) <- c("timestamp", "price", "volume", "symbol")
#   write.csv(x = temp, file = paste(new_path, stockq[i], sep = ''), col.names = TRUE, row.names = FALSE)
# }

append_symbol(data_path = data_path, modified_path = new_path)

append_symbol <- function(data_path, modified_path) {
  stockq = list.files(pattern = "*.csv", path = data_path)
  
  for (i in 1:length(stockq)) {
    temp = fread(paste(data_path, stockq[i], sep = ''))
    symbol = strsplit(stockq[i], "-")[[1]][1]
    temp$symbol = symbol
    names(temp) <- c("timestamp", "price", "volume", "symbol")
    write.csv(x = temp, file = paste(modified_path, stockq[i], sep = ''), col.names = TRUE, row.names = FALSE)
  }
}

# x = fread(paste(data_path, stockq[2], sep = ''))
# symbol = strsplit(stockq[2], "-")[[1]][1]
# x$symbol = symbol
# names(x) <- c("timestamp", "price", "volume", "symbol")
# write.csv(x = x, file = stockq[2], col.names = TRUE, row.names = FALSE)
