class AddColumnTokenPaymentInOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :token_payment, :string
  end
end
