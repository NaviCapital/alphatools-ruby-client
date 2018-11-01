require "pry"

require_relative "app/controllers/application_controller"
require_relative "app/controllers/orders_controller"

require_relative "app/models/base_model"
require_relative "app/models/order"

require_relative "router"

controllers = { orders: OrdersController.new }

Router.new(controllers).run
