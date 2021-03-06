# Route actions to controllers
class Router
  def initialize(controllers = {})
    @orders_controller = controllers[:orders]
    @instruments_controller = controllers[:instruments]
    @lendings_controller = controllers[:lendings]
    @running = true
  end

  def run
    @running = true
    clear_screen
    while @running
      print_menu
      action = ask_for(:action).to_i
      route(action)
      wait && clear_screen
    end
  end

  private

  def print_menu
    puts "1. Save today orders to csv"
    puts "2. Import orders from csv"
    puts "3. Save instruments to csv"
    puts "4. Save lending suggestions to json"
    puts "9. Exit"
  end

  def route(action)
    clear_screen
    case action
    when 1 then @orders_controller.save_to_csv
    when 2 then @orders_controller.import_from_csv
    when 3 then @instruments_controller.save_to_csv
    when 4 then @lendings_controller.save_to_json
    when 9 then @running = false
    else puts "Wrong action. Try again."
    end
  end

  def ask_for(label)
    puts "==================="
    puts "Introduce #{label}:"
    print "> "
    gets.chomp
  end

  def clear_screen
    puts `clear`
  end

  def wait
    puts "<press enter to continue>"
    gets.chomp
  end
end
