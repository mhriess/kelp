FactoryGirl.define do
  factory :review do
    reviewer { (Faker::Name.name) }
    body { Faker::Lorem.paragraph }
    restaurant_id { rand() * 10 }
    rating { (rand() * 6).floor }
  end
end