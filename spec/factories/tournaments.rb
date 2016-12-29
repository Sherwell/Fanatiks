FactoryGirl.define do
  factory :tournament do
    name Faker::Book.title
    year Faker::Number.between(2016, 2020)
    league
  end
end
