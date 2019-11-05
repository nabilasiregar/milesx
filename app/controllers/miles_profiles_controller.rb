require 'json'
require 'open-uri'
require 'rest-client'
class MilesProfilesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params[:departure].present? && params[:arrival].present?
      departure = params[:departure][0..2]
      arrival = params[:arrival][0..2]
      url = "https://milez.biz/api/list_rates.php?pid=162&key=b36e4feae136787dcfdcb7d648a7a1fe9efc2ff5087fcccb831e7fc6622b215e&f=#{departure}&t=#{arrival}&ffp=1|2|3|4&langid=1"
      data_serialized = RestClient::Request.execute(method: :get, url: url, timeout: 10, verify_ssl: false)
      json_data = JSON.parse(data_serialized)

      programme = json_data['data'][0]['prog_name']
      price_economy =  json_data['data'][0]['rates'][0]['rate']
      price_business = json_data['data'][0]['rates'][1]['rate']
      price_first = json_data['data'][0]['rates'][2]['rate']

      departure = json_data['origin']
      arrival = json_data['destination']
    else
    end
  end
end



