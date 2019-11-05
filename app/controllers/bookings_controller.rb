class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @past_bookings = Booking.where("end_date < ?", "#{Date.today}")
  end

  def create
    if user_signed_in?
    if current_user.present?
        @booking = Booking.new(booking_params)
    if @booking.save
        direct_to booking_path(@booking)
        flash[:notice] = 'Your flight has been booked!'
    else
        render 'bookings/show'
    end
  end

end
