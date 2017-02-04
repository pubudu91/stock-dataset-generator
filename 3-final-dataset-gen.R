library(data.table)

# Read the symbols which are in the portfolio
portfolio_symbols = fread("portfolio-symbols.csv",
                          col.names = c("symbol"),
                          header = FALSE)
price_updates = fread("modified-data/23/all-data_1-23.csv")

setkey(portfolio_symbols, symbol)
setkey(price_updates, timestamp, symbol)

# Filter out the prices updates for the symbols contained in $portfolio_symbols
ps_symbols = merge(price_updates, portfolio_symbols)

# Sample the ps_symbols table to select a set of price updates to be used as portfolio updates
pu_indices = sample(nrow(ps_symbols), 200)
portfolio_updates = ps_symbols[pu_indices]

portfolio_updates$pid = 1
portfolio_updates$volume = sample(seq(10, 300)) # Assign random purchases to the portfolio updates
setkey(portfolio_updates, timestamp, symbol)

price_updates$volume = NULL

# Merge to get the final price and portfolio updates table
pandpf_updates = merge(
  price_updates,
  portfolio_updates,
  by = c("timestamp", "symbol", "price"),
  all.x = TRUE
)

write.csv(
  x = pandpf_updates,
  file = "modified-data/23/backtest-data-jan23.csv",
  col.names = FALSE,
  row.names = FALSE,
  quote = FALSE
)
