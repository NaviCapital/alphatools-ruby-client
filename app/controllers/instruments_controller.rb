class InstrumentsController < BaseController
  private

  def load_elements
    post("instruments", "get_instruments", is_active: true)
  end
end
