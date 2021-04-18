module SharesHelper
  def change_percent(share)
    change = share.price - share.open_price
    percent = change / share.open_price * 100
    number_to_percentage(percent,precision:2)
  end

end
