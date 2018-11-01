class OrdersController < ApplicationController
  def list
    puts "id | instrument | side | qty"
    load_orders.each do |k, v|
      puts [k, v["instrument_id"], v["side"], v["quantity"]].join(" - ")
    end
  end

  def import_from_csv
    csv_path = "data/orders.csv"
    options = { headers: true, header_converters: :symbol }
    CSV.foreach(csv_path, options) do |row|
      row[:instrument_id] = row[:instrument_id].to_i
      row[:side] = row[:side].to_i
      row[:quantity] = row[:quantity].to_f
      row[:broker_id] = row[:broker_id].to_i
      row[:base_price] = 0
      row[:notes] = ""
      post("execution", "add_orders", orders: [row.to_h], user_id: 1)
    end
  end

  private

  def load_orders
    post("execution", "get_order_info")
  end
end
