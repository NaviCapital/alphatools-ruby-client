class OrdersController < BaseController
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

  def load_elements
    post("execution", "get_order_info", start_date: today, end_date: today)
  end
end
