class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name
      t.string :cnpj, :limit => 14
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user, index: true
      t.timestamps
    end
  end
end
