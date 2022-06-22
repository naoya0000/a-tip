class Admin::AnimesController < ApplicationController
  before_action :if_not_admin
  before_action :set_anime, only: [:show, :edit, :update, :destroy]
  
  def index
    @pagy, @animes = pagy(Anime.all, items: 30)
  end

  def show
  end

  def new
    @anime = Anime.new
  end
  
  def create
    @anime = Anime.new(anime_params)

    if @anime.save
      flash[:success] = '正常に投稿されました'
      redirect_to admin_animes_path
    else
      flash.now[:danger] = '正常に投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @anime.update(anime_params)
      flash[:success] = '正常に更新されました'
      redirect_to action: :show
    else
      flash.now[:danger] = '正常に更新されませんでした'
      render :edit
    end
  end

  def destroy
    @anime.destroy

    flash[:success] = '正常に削除されました'
    redirect_to admin_animes_path
  end
  
  
  private
  
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def set_anime
    @anime = Anime.find_by(params[:id])
  end
  
  def anime_params
    params.require(:anime).permit(:title1, :title2, :img1, :img2, :remove_img1, :remove_img2, :company, :category, :season, :pickup)
  end
  
end
