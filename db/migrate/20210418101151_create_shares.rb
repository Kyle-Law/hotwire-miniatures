class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|
      t.string :name
      t.decimal :price
      t.string :ticker_symbol
      t.decimal :open_price
      t.decimal :closed_price
      t.decimal :beta

      t.timestamps
    end
  end
end
