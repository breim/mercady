class AddPriceToProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :price
  	add_column :products, :price, :string
  end
end
