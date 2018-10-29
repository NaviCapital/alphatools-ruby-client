require_relative 'rest_client_helper'

def orders_from_inoa
  inoa_orders = request('execution', 'get_order_info')

  orders = []
  inoa_orders.keys.each do |id|
    orders << OpenStruct.new(inoa_orders[id])
  end
  orders
end
