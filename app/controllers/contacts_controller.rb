class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = 'お問い合わせを受け付けました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'お問い合わせの受け付けを完了できませんでした。'
      render :new
    end
  end
  
  def thanks
  end
  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
  
end
