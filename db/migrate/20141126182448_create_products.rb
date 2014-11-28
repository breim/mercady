class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size

      t.references :market
      t.references :user
      t.string :slug, unique: true
      t.timestamps
    end
  end
end
