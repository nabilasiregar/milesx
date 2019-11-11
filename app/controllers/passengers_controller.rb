class PassengersController < ApplicationController

  def create
    @passenger = passenger.new(passenger_params)
    @booking = Booking.find(params[:booking_id])
    @passenger.booking = @booking
    if @passenger.save
       redirect_to booking_path(@passenger.booking)
    else

    render 'bookings/show'

    end
  end

  private

  def passenger_params
    params.require(:passenger).permit(:first_name, :last_name, :birth_date)
  end
end
