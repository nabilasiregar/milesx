class RequestsController < ApplicationController

  def show
    @request = Request.find(params[:request_id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(requests_params)
      redirect_to booking_path(@request.booking)
    end
  end

  private

  def requests_params
    params.require(:request).permit(:confirmed, :photo, :booking_id)
  end
end
