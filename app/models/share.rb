class Share < ApplicationRecord
  after_create_commit { broadcast_append_to "shares" }
  after_update_commit { broadcast_replace_to "shares" }
  after_destroy_commit { broadcast_remove_to "shares" }

  def self.stock_market_open(boolean)
    update_count = 0
    Share.find_each {|s| update(open_price: s.closed_price)}
    bullish = [true,false].sample
    market_change_percent = bullish ? rand(0..3.0) : rand(-3.0..0)
    while boolean && update_count < 10
      fluctuation = rand(-0.3..0.3)
      market_change = market_change_percent + fluctuation
      Share.find_each do |s|
        change = market_change / 100 * s.beta * s.open_price
        s.update(price: s.open_price + change)
        update_count +=1
      end
      sleep(1.seconds)
    end
    Share.find_each {|s| update(closed_price: s.price)}
  end

  def self.update_price
    update_count = 0
    Share.find_each {|s| update(open_price: s.closed_price)}
    bullish = [true,false].sample
    market_change_percent = bullish ? rand(0..3.0) : rand(-3.0..0)
    while update_count < 1
      fluctuation = rand(-0.3..0.3)
      market_change = market_change_percent + fluctuation
      Share.find_each do |s|
        change = market_change / 100 * s.beta * s.open_price
        s.update(price: s.open_price + change)
        update_count +=1
      end
      sleep(1.seconds)
    end
    Share.find_each {|s| update(closed_price: s.price)}
  end
end
