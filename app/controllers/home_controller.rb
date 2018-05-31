class HomeController < ApplicationController
  
  def mailer
    if user_signed_in?
      ContactMailer.contact(current_user, Item.first).deliver_now
      redirect_to root_path
    end
  end

  def index
    @chats = Item.all
    if user_signed_in?
    	@cart = Cart.find_by(user_id: current_user.id)
    	if @cart != nil
	  		associations = AssociateItemCart.where(cart_id: @cart.id)
	  		@items = []
	  		associations.each do |a|
	  			@items.push(Item.find(a.item_id))
	  		end
    	else
    		@cart = Cart.new
    		current_user.cart = @cart
    		@cart.save
    		@items = []
    	end
    end
  end

  def show
  	@cat = Item.find(params[:id])
  	if user_signed_in?
    	@cart = Cart.find_by(user_id: current_user.id)
  		associations = AssociateItemCart.where(cart_id: @cart.id)
  		@items = []
  		associations.each do |a|
  			@items.push(Item.find(a.item_id))
  		end
    end
  end

  
end
