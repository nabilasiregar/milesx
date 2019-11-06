class RequestsController < ApplicationController
  def show
    @request = Request.find(params[:request_id])
  end

  def create
    @request = Request.new
  end
end
