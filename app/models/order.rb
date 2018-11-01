# Inoa Module: Order
class Order < BaseModel
  def initilize(attributes = {})
    @instrument_id = attributes[:instrument_id]
    @side = attributes[:side]
    @quantity = attributes[:quantity]
    @broker_id = attributes[:broker_id]
    @date = attributes[:date] || today
    @base_price = attributes[:base_price] || 0
    @notes = attributes[:notes] || ""
  end
end
