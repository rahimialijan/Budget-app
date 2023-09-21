# spec/factories/entities.rb

FactoryBot.define do
  factory :entity do
    name { Faker::Commerce.product_name }
    user
  end
end
