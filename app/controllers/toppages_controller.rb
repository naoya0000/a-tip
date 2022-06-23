class ToppagesController < ApplicationController
  
  def index
    @animes_pickup2 = Anime.where(pickup: 2)
    @animes_season2 = Anime.where(season: 2)
  end
end
