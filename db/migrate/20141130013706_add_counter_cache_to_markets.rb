class AddCounterCacheToMarkets < ActiveRecord::Migration
  def change
  	add_column :markets, :products_count, :integer , :default => 0
  end
end
