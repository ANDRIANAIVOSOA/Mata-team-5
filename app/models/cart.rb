class Cart < ApplicationRecord

    has_and_belongs_to_many :items
    has_one :users, class_name: 'User'

end
