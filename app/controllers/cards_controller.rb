class CardsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create]
  
  def new
    redirect_to root_path if logged_in? && current_user.card
  end
  
  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer = Payjp::Customer.create(
      description: 'test', 
      card: params[:card_id] 
    )

    card = Card.new(
      customer_id: customer.id,
      card_id: params[:card_id],
      user_id: current_user.id
    )

    if card.save
      redirect_to root_path
    else
      flash.now[:danger] = 'カード登録に失敗しました。'
      render :new
    end 
  end
  
end
