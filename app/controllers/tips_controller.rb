class TipsController < ApplicationController
  before_action :require_user_logged_in
  
  
  def create
    return redirect_to new_card_path unless current_user.card.present?
    @tip = current_user.tips.build(tip_params)
    if @tip.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPに秘密鍵を設定
      customer_id = current_user.card.customer_id # 顧客idを取得
      Payjp::Charge.create( # PAY.JPに購入価格と顧客id、通貨の種類を渡す
        amount: tip_params[:money],
        customer: customer_id,
        currency: 'jpy' 
      )
      @tip.save
      redirect_to action: :thanks
    else
      flash[:danger] = 'チップを送ることができませんでした。'
      redirect_to request.referer
    end
  end
  
  def thanks
  end
  
  private

  def tip_params
    params.require(:tip).permit(:title, :company, :money)
  end
end
