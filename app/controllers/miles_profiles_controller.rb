class MilesProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @miles_profile = Miles_Profile.all
  end

  def show
    set_miles_profile
    @miles_profile = Miles_Profile.new
  end

  # def new
  #   @miles_profile = Miles_profile.new
  #   authorize @miles_profile
  #   if user_signed_in?
  #     if current_user.present?
  #     else
  #       redirect_to new_user_registration_path
  #       flash[:alert] = 'Please sign up to view your miles summary'
  #     end
  #   else
  #     redirect_to user_session_path
  #     flash[:alert] = 'Please log in to view your miles summary'
  #   end
  # end

  def create
    @miles_profile = Miles_profile.new(miles_profile_params)
    authorize @miles_profile
    @miles_profile.user = current_user
    if @miles_profile.save
      redirect_to miles_profile_path(@miles_profile), notice: "Your plane has been listed!"
    else
      render :new
    end
  end

  def edit
    set_miles_profile
    authorize @miles_profile
  end

  def update
    set_miles_profile
    authorize @miles_profile
    if @miles_profile.update(miles_profile_params)
      redirect_to miles_profile_path(@miles_profile)
    else
      render :edit
    end
  end

  def destroy
    set_miles_profile
    authorize @miles_profile
    @miles_profile.destroy
    redirect_to profile_path
  end

  private

  def set_miles_profile
    @miles_profile = Miles_profile.find(params[:id])
  end

  def miles_profile_params
    params.require(:miles_profile).permit(:airplane_id, :description, :airport, :price_per_day, :title, :photo)
  end
end

end
