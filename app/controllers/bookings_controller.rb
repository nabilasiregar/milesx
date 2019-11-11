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
    departure_date = params[:departure_date]
    return_date = params[:return_date]
    @booking = Booking.new(bookings_params)
    @booking.departure_date = departure_date
    @booking.return_date = return_date
    @booking.user = current_user
    @booking.status = 'pending'
    @booking.price = 500 #calculate price based on user selection
    @booking.miles_profile = current_user.miles_profile
    if @booking.save!
      passenger = Passenger.new(passenger_params)
      passenger.booking_id = @booking.id
      @requests = Request.new
      @requests.confirmed = 'pending'
      @requests.booking = @booking
      @requests.save!
      if passenger.save!
        # redirect_to dashboard_path
        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
              name: "#{@booking.departure} to #{@booking.arrival}",
              amount: @booking.price,
              currency: 'usd',
              quantity: 1
            }],
            success_url: dashboard_url,
            cancel_url: dashboard_url
          )
        flash[:notice] = 'Your flight booking has been requested!'
        @booking.update(checkout_session_id: session.id)
        redirect_to new_booking_payment_path(@booking)
      else
        render "bookings/new"
      end
    else
      render "bookings/new"
    end
  end

  def new
    @departure = params[:departure]
    @arrival = params[:arrival]
    @places = session[:params].split(' ').filter { |wo| wo.length == 3 }
    @booking = Booking.new(departure: @departure, arrival: @arrival)

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
    # need to create new passenger here
  end

  private

  def bookings_params
    params.require(:booking).permit(:flight_number, :departure, :arrival, :departure_date, :return_date, :price)
  end

  def passenger_params
    params.require(:passenger).permit(:first_name, :last_name, :birth_date)
  end
end
