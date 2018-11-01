class LendingsController < BaseController
  private

  def load_elements
    post("lending", "get_lending_suggestions", date: today)
  end
end
