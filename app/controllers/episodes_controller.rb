class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
    @appearance = Appearance.find(@episode.appearances.ids)
  end


end
