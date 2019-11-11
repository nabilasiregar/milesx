class RequestsController < ApplicationController

  def show
    @request = Request.find(params[:request_id])
  end

  private

  def requests_params
    params.require(:request).permit(:confirmed, :photo, :booking_id)
  end
end
