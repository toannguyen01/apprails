FactoryBot.define do
  factory :user do  
    email 'email@gmail1.com'
    name 'name'  
    password 'pass12345'
    confirmed_at Time.now
  end
end