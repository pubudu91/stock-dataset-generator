append_symbol <- function(data_path, modified_path) {
  stockq = list.files(pattern = "*.csv", path = data_path)
  
  for (i in 1:length(stockq)) {
    temp = fread(paste(data_path, stockq[i], sep = ''))
    symbol = strsplit(stockq[i], "-")[[1]][1]
    temp$symbol = symbol
    names(temp) <- c("timestamp", "price", "volume", "symbol")
    temp = temp[order(timestamp)]
    write.csv(x = temp, file = paste(modified_path, stockq[i], sep = ''), col.names = TRUE, row.names = FALSE)
  }
}
