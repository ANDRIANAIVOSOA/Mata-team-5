class Item < ApplicationRecord
    has_many :associate_item_carts
    has_many :cart, through: :associate_item_carts
    has_many :associate_order_items
    has_many :order, through: :associate_order_items

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true
    validates :image_url, presence: true, uniqueness: true
end
