class CartController < ApplicationController
  
  def cart
  	if user_signed_in?
  		@cart = Cart.find_by(user_id: current_user.id)
      associations = AssociateItemCart.where(cart_id: @cart.id)
      if associations != nil
        @items = []
        associations.each do |a|
          @items.push(Item.find(a.item_id))
        end
        if @cart != nil
          associations = AssociateItemCart.where(cart_id: @cart.id)
          @items = []
          associations.each do |a|
            @items.push(Item.find(a.item_id))
          end
          #redirect_to cart_path
        else
          @cart = Cart.new
          current_user.cart = @cart
          @cart.save
          @items = []
          #redirect_to cart_path
        end
      end 
      
  	else
  		redirect_to(user_session_path)
  	end
  end

  def create
    if user_signed_in?
      # tadiavina @ alalan'ilay id-any ilay item
         item = Item.find(params[:id])
      # jerena ny panier anle user connecté
         @cart = Cart.find_by(user_id: current_user.id)
      # jerena ra misy anle item selectionné anaty association
         associations = AssociateItemCart.find_by(item_id: item.id)

         # jerena ra efa manana cart ilay user
         if @cart!=nil
            # jerena ra efa associé ilay item
            if associations == nil
                assoc = AssociateItemCart.new
                assoc.item = item
                assoc.cart = @cart
                assoc.save

                flash[:success] = "Ajouté avec succés"
                # miverina eo @le item iany
                #redirect_to item_show_path(params[:id])
                puts "OKKKKKKKKKKKKK"
                redirect_to root_path
            else
                flash[:error] = "Photo déjà au panier"
                #redirect_to item_show_path(params[:id])
                puts "NOOOOONNNNNNNN"
                redirect_to root_path
            end
         else
            cart = Cart.new
            cart.user = current_user
            assoc = AssociateItemCart.new
            assoc.item = item
            assoc.cart = cart
            assoc.save

            flash[:success] = "Ajouté avec succés"
            # miverina eo @le item iany
            #redirect_to item_show_path(params[:id])
            puts "OKKKKKKKKKKKKK"
            redirect_to root_path
         end

    else
      flash[:error] = "Vous devez vous inscrire !"
  		redirect_to user_session_path
    end
  end

  def destroy
    if user_signed_in?

      #stripe
      
      @amount = 500

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'eur'
      )
    
       # envoie mail
       ContactMailer.contact(current_user, Item.first).deliver_now
        
       cart = Cart.find_by(user_id: current_user.id)
       a=AssociateItemCart.where(cart_id: cart.id)
       if a != nil
         a.each do |ass|
           ass.delete
         end
       end

      rescue Stripe::CardError => e
        flash[:error] = e.message

        redirect_to root_path#payer_path
    else
        redirect_to root_path

    end

  end
end

