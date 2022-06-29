class SessionsController < ApplicationController
  before_action :reject_user, only: [:create]
  
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
  
  protected

  def reject_user
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user
      if @user.is_deleted
        flash[:danger] = "退会済みです。"
        redirect_to root_url
      end
    end
  end
  
end
