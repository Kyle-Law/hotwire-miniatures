bundle add hotwire-rails
rails hotwire:install

rails g scaffold description:text price:decimal quantity:integer

rails g scaffold share name price:decimal ticker_symbol open_price:decimal closed_price:decimal beta:decimal
