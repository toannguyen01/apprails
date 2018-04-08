class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :address, :string
    add_column :users, :address2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :zipcode, :string
    add_column :users, :phone, :string
  end
end
