require 'json'
require 'open-uri'
require 'rest-client'
class MilesProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_miles_profile, only: [:show, :edit, :update, :destroy]

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

  def show
    @miles_profile = MilesProfile.find(params[:id])
  end

  # def new
  #   @miles_profile = Miles_profile.new
  #   authorize @miles_profile
  #   if user_signed_in?
  #     if current_user.present?
  #     else
  #       redirect_to new_user_registration_path
  #       flash[:alert] = 'Please sign up to view your miles summary'
  #     end
  #   else
  #     redirect_to user_session_path
  #     flash[:alert] = 'Please log in to view your miles summary'
  #   end
  # end

  def create
    @miles_profile = MilesProfile.new(miles_profile_params)
    authorize @miles_profile
    @miles_profile.user = current_user
    if @miles_profile.save
      redirect_to miles_profile_path(@miles_profile), notice: "Miles Profile Created!!"
    else
      render :new
    end
  end

  def edit
    authorize @miles_profile
  end

  def update
    authorize @miles_profile
    if @miles_profile.update(miles_profile_params)
      redirect_to miles_profile_path(@miles_profile)
    else
      render :edit
    end
  end

  def destroy
    authorize @miles_profile
    @miles_profile.destroy
    redirect_to profile_path
  end

  private

  def set_miles_profile
    @miles_profile = MilesProfile.find(params[:id])
  end

  def miles_profile_params
    params.require(:miles_profile).permit(:user_id, :programme, :amount, :price)
  end
end


