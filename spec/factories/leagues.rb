FactoryGirl.define do
  factory :league do
    name Faker::Company.name
    logo "https://hydra-media.cursecdn.com/smite.gamepedia.com/thumb/c/ca/NNF.png/250px-NNF.png?version=586aa613282453c14a9d608d57123657"
    active false
    start_date Faker::Date.forward(1)
    end_date Faker::Date.between(2.days.from_now, 6.months.from_now)
    sport
  end
end