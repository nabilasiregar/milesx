require 'json'
require 'open-uri'
require 'rest-client'
require 'digest'


class MilesProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_miles_profile, only: [:show, :edit, :update, :destroy]
  def index
    if params[:departure].present? && params[:arrival].present?
      departure = params[:departure][0..2]
      arrival = params[:arrival][0..2]
      digest = OpenSSL::Digest.new('sha256')
      key = OpenSSL::HMAC.hexdigest(digest, 'lewagon', "f=#{departure}&t=#{arrival}&ffp=8|16&langid=1")
      url = "https://milez.biz/api/list_rates.php?pid=162&key=#{key}&f=#{departure}&t=#{arrival}&ffp=8|16&langid=1"
      data_serialized = RestClient::Request.execute(method: :get, url: url, verify_ssl: false)
      json_data = JSON.parse(data_serialized)
      @results = json_data['data']
      @departure = json_data['origin']
      @arrival = json_data['destination']
    end
  end

  def show
    @miles_profile = MilesProfile.find(params[:id])
  end

  def new
    @miles_profile = Miles_profile.new
    if user_signed_in?
      if current_user.present?
      else
        redirect_to new_user_registration_path
        flash[:alert] = 'Please sign up to view your miles summary'
      end
    else
      redirect_to user_session_path
      flash[:alert] = 'Please log in to view your miles summary'
    end
  end

  def create
    @miles_profile = MilesProfile.new(miles_profile_params)
    @miles_profile.user = current_user
    if @miles_profile.save
      redirect_to miles_profile_path(@miles_profile), notice: "Miles Profile Created!!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @miles_profile.update(miles_profile_params)
      redirect_to miles_profile_path(@miles_profile)
    else
      render :edit
    end
  end

  def destroy
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


