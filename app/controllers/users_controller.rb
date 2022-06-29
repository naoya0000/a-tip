class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def hide
    @user = User.find(params[:id])
  	@user.update(is_deleted: true)
  	reset_session
  	flash[:primary] = "ありがとうございました。またのご利用を心よりお待ちしております。"
  	redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
