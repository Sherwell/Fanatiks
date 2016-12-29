FactoryGirl.define do
  factory :group_team do
    pg Faker::Number.between(1, 10)
    pe Faker::Number.between(1, 10)
    pp Faker::Number.between(1, 10)
    gf Faker::Number.between(5, 10)
    gc Faker::Number.between(1, 4)
    group
    team
  end
end
