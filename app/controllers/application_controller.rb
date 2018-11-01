require "rest-client"
require "json"
require "csv"

# Shared Methods between Controllers
class ApplicationController
  def today
    Date.today.strftime('%Y-%m-%d')
  end

  def post(modulo, metodo, params = {})
    url = "#{ENV['ALPHA_BASE_URL']}/api/2/sync/#{modulo}/#{metodo}"
    req = RestClient::Request.execute(
      method: :post, url: url, payload: params.to_json,
      user: ENV['ALPHA_USERNAME'], password: ENV['ALPHA_PASSWORD'])
    JSON.parse(req.body)
  end
end
