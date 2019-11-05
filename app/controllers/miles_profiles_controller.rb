class MilesProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_miles_profile, only: [:show, :edit, :update, :destroy]

  def index
    @miles_profile = MilesProfile.all
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
