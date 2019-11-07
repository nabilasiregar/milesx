class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @miles_profile = current_user.miles_profile
  end

  def accept_booking
    request = Request.find(params[:id])
    request.confirmed = "confirmed"
    request.save
    booking = request.booking
    booking.status = "confirmed"
    booking.save
    redirect_to dashboard_path
  end

  def decline_booking
    request = Request.find(params[:id])
    request.confirmed = "declined"
    request.save
    booking = request.booking
    booking.status = "declined"
    booking.save
    redirect_to dashboard_path
  end
end
