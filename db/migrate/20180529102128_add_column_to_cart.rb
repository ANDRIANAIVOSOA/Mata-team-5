class AddColumnToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :nom, :string
  end
end
