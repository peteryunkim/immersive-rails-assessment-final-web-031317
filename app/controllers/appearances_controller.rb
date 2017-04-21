class AppearancesController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def edit
    @episode = Episode.find(params[:id])
    @appearance = Appearance.find(@episode.appearances.ids)
  end

  def update
    @appearance = Appearance.find(params[:id])
    @appearance.update(appearance_params)
    @appearance.save
    redirect_to @appearance.episode
  end




  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

end
