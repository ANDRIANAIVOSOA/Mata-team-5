class HomeController < ApplicationController
  def index
    
  end
  def mailer
    if user_signed_in?
      ContactMailer.contact(current_user, Item.first).deliver_now
      redirect_to root_path
    end
  end
end
