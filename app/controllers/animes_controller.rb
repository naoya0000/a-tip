class AnimesController < ApplicationController
  
  def index
    @pagy, @animes = pagy(Anime.all, items: 5)
  end

  def show
    @anime = Anime.find(params[:id])
    @tip = current_user.tips.build(title: @anime.title1, company: @anime.company)
  end
  
  def search
    @animes = Anime.search(params[:keyword])
  end
  
  def thanks
  end
  
end
