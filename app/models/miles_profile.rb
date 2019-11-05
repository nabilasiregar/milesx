class MilesProfile < ApplicationRecord

  def index
    @miles_profile = MilesProfile.new
  end

  def show
    set_miles_profile
    @miles_profile = miles_profile.new
  end

  def new
    @miles_profile = MilesProfile.new
    if user_signed_in?
      if current_user.present?
      else
        redirect_to new_user_registration_path
        flash[:alert] = 'Please sign up before submitting up your Airline Miles profile'
      end
    else
      redirect_to user_session_path
      flash[:alert] = 'Please log in before submitting your Airline Miles profile'
    end
  end

  def create
    @miles_profile = MilesProfile.new(miles_profile_params)
    @miles_profile.user = current_user
    if @miles_profile.save
      redirect_to airplane_path(@miles_profile), notice: "Your plane has been listed!"
    else
      render :new
    end
  end

  def edit
    set_miles_profile
  end

  def update
    set_miles_profile
    if @miles_profile.update(miles_profile_params)
      redirect_to airplane_path(@miles_profile)
    else
      render :edit
    end
  end

  def destroy
    set_miles_pofile
    @MilesProfile.destroy
    redirect_to profile_path
  end

  private

  def set_miles_profile
    @MilesProfile = MilesProfile.find(params[:id])
  end

  def miles_profile_params
    params.require(:MilesProfile).permit(:airplane_id, :description, :airport, :price_per_day, :title, :photo)
  end
end
