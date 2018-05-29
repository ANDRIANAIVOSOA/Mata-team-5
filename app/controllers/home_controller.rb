class HomeController < ApplicationController
  def index
    @chats = Item.all
  end
end
