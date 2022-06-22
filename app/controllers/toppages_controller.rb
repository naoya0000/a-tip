class ToppagesController < ApplicationController
  
  def index
    @animes_pickup2 = Anime.where(pickup: 2)
  end
end
