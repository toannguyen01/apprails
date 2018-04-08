FactoryBot.define do
  factory :order do
    order_status "In Progress"
    user_id { create(:user).id }
  end
end