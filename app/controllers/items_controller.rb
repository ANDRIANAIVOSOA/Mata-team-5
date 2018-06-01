class ItemsController < ApplicationController
  
  def index
    @chats = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @price = params['price'].to_d
    #puts @price
    @item = Item.new(title: params['title'], description: params['description'], price: @price, image_url: params['image_url'])
    if @item.save
      redirect_to item_path(@item.id)
    else
      render "new"
    end
  end
 
  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update!(item_params)
    redirect_to item_path
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url)
  end
end
