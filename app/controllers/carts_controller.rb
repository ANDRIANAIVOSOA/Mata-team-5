class CartsController < ApplicationController
  def new
    @carts = Cart.new
  end

  def create
    cart_params = params.require(:cart).permit(:nom)
    @cart = Cart.new(cart_params)
    @cart.user_id = current_user.id
    if @cart.save
      redirect_to home_path
      flash[:notice] = "done"
    else 
      flash[:error] = "error"
      render 'new'
    end
    
  end

  def show
  end
end
