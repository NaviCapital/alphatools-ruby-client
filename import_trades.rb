require_relative 'helpers/executions_helper'

inoa_orders = orders_from_inoa

inoa_orders.each do |order|
  puts "Order #{order.order_id} tem quantidade #{order.quantity}"
end
