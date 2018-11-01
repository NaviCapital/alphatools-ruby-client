require "rest-client"
require "json"
require "csv"

# Shared Methods between Controllers
class BaseController
  def save_to_csv
    model_name = self.class.to_s.split("Controller").first.downcase
    elements = load_elements
    CSV.open("data/#{model_name}.csv", "w") do |csv|
      csv << elements.values.first.keys.reverse
      elements.values.each do |hash|
        csv << hash.values.reverse
      end
    end
  end

  def save_to_json
    elements = load_elements
    model_name = self.class.to_s.split("Controller").first.downcase
    File.open("data/#{model_name}.json", "w") do |file|
      file.write(elements)
    end
  end

  def today
    Date.today.strftime("%Y-%m-%d") # 2018-10-16
  end

  def post(modulo, metodo, params = {})
    url = "#{ENV['ALPHA_BASE_URL']}/api/2/sync/#{modulo}/#{metodo}"
    req = RestClient::Request.execute(
      method: :post, url: url, payload: params.to_json,
      user: ENV["ALPHA_USERNAME"], password: ENV["ALPHA_PASSWORD"])
    JSON.parse(req.body)
  end
end
