class AddColumnInfoInOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :name, :string
    add_column :orders, :address, :string
    add_column :orders, :phone, :string
  end
end
