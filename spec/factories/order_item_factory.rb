FactoryBot.define do
  factory :order_item do
    product_id { create(:product).id }
    order_id { create(:order).id }
    unit_price 12.0
    quantity 2
    total_price 24.0
  end
end