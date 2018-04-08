class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.boolean :published, default: true
      t.string :sku
      t.string :image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
