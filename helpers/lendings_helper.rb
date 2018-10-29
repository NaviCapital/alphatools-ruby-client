require_relative 'rest_client_helper'

def add_lending_agreement(lending)
  new_order = {
    "instrument_id": lending[:instrument_id].to_i,
    "side": 1,
    "quantity": 100,
    "broker_id": 1,
    "date": Date.today.strftime("%Y-%m-%d"),
    "base_price": 0, "notes": ""
  }
  post('execution', 'add_orders', { "orders": [new_order], "user_id": 1 })
end
