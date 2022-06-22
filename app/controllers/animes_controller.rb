class AnimesController < ApplicationController
  
  def index
    @pagy, @animes = pagy(Anime.all, items: 10)
  end

  def show
    @anime = Anime.find(params[:id])
  end
  
end
