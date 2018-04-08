FactoryBot.define do 
  factory :product do
      sku '123'
      name  'IPhone 1'
      price 12.0
      category_id { create(:category).id }
    end
end