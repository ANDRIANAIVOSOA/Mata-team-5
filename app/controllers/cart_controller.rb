class CartController < ApplicationController
  def create
    if user_signed_in?
      # tadiavina @ alalan'ilay id-any ilay item
         item = Item.find(params[:id])
      # jerena ny panier anle user connecté
         @cart = Cart.find_by(user_id: current_user.id)
      # jerena ra misy anle item selectionné anaty association
         associations = AssociatiateItemCart.find_by(item_id: item.id)

         # jerena ra efa manana cart ilay user
         if @cart!=nil
            # jerena ra efa associé ilay item
            if associations == nil
                assoc = AssociatiateItemCart.new
                assoc.item = item
                assoc.cart = @cart
                assoc.save

                flash[:success] = "Ajouté avec succés"
                # miverina eo @le item iany
                #redirect_to item_show_path(params[:id])
            else
                flash[:error] = "Photo déjà au panier"
                #redirect_to item_show_path(params[:id])
            end
         else
            cart = Cart.new
            cart.user = current_user
            assoc = AssociatiateItemCart.new
            assoc.item = item
            assoc.cart = cart
            assoc.save

            flash[:success] = "Ajouté avec succés"
            # miverina eo @le item iany
            #redirect_to item_show_path(params[:id])
         end

    else
      flash[:error] = "Vous devez vous inscrire !"
  		redirect_to user_session_path
    end
  end
end
