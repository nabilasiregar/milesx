class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  # def index
  #   @bookings = Booking.all
  # end

  def show
    @booking = Booking.find(params[:id])
    # @past_bookings = Booking.where("end_date < ?", Date.today)
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
        @booking.miles_profile = current_user.miles_profile

    if @booking.save
      redirect_to booking_path(@booking)
      flash[:notice] = 'Your flight booking has been requested!'
    else
      raise
      render 'miles_profiles/show'
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

  private

  def bookings_params
    params.require(:booking).permit(:flight_number, :departure, :arrival, :departure_date, :return_date)
  end
end
