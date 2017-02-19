FactoryGirl.define do
  factory :prediction do
    date "2017-02-19 10:27:19"
    value 1.5
  end
  factory :record do
    glycemia { Faker::Number.between(80, 130) }
    carbohydrates { Faker::Number.between(0, 300) }
    meal_insulin { Faker::Number.between(0, 30) }
    correction_insulin { Faker::Number.between(-10, -5) }
    activity { Faker::Number.between(-100, 200) }
  end
end
