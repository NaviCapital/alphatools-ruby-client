require 'date'

# Shared methods between models
class BaseModel
  def today
    Date.today.strftime('%Y-%m-%d')
  end
end
