class AddGeoLocsToMarket < ActiveRecord::Migration
  def change
  	add_column :markets, :city, :string
  	add_column :markets, :state, :string
  	add_column :markets, :phone, :string
  end
end
