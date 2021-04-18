json.extract! share, :id, :name, :price, :ticker_symbol, :open_price, :closed_price, :beta, :created_at, :updated_at
json.url share_url(share, format: :json)
