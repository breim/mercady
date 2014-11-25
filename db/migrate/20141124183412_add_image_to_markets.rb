class AddImageToMarkets < ActiveRecord::Migration
  def change
  	  add_column :markets, :image_file_name, :string
      add_column :markets,:image_content_type, :string
      add_column :markets, :image_file_size, :integer
  end
end
