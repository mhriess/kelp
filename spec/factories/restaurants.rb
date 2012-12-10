neighborhoods = ["West Portal", "Nob Hill", "Nopa", "Financial District"]

FactoryGirl.define do
  factory :restaurant do
    name { Faker::Company.name }
    neighborhood { neighborhoods[rand() * 4] }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zipcode { Faker::Address.zip_code }
  end
end