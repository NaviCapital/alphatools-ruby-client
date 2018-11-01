require "pry"

require_relative "app/controllers/base_controller"
require_relative "app/controllers/orders_controller"
require_relative "app/controllers/instruments_controller"
require_relative "app/controllers/lendings_controller"

require_relative "app/models/base_model"
require_relative "app/models/order"

require_relative "router"

controllers = {
  instruments: InstrumentsController.new,
  orders: OrdersController.new,
  lendings: LendingsController.new,
}

Router.new(controllers).run
