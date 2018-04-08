class AddColumnInOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :status, :boolean
    add_column :orders, :total_amount, :integer
    add_column :orders, :payer_id, :string
    add_column :orders, :payment_id, :string
    add_column :orders, :finished, :boolean
    add_reference :orders, :user, index: true 
  end
end
