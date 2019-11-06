class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  # def index
  #   @bookings = Booking.all
  # end

  # def show
  #   @booking = Booking.find(params[:id])
  #   @past_bookings = Booking.where("end_date < ?", Date.today)
  # end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      direct_to booking_path(@booking)
      flash[:notice] = 'Your flight has been booked!'
    else
      render 'miles_profile/show'
    end
  end

  def new
    @booking = Booking.new
    if user_signed_in?
      if current_user.present?
      else
        redirect_to new_user_registration_path
        flash[:alert] = 'Please sign up to book this flight.'
      end
    else
      redirect_to user_session_path
      flash[:alert] = 'Please log in to book this flight.'
    end
  end
end
