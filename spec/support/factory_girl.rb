FactoryGirl.define do
  factory :staff do
    first_name     { Faker::Name.first_name }
    last_name      { Faker::Name.last_name }
  end

  factory :preference do
    patient_id      { Faker::Number.between(1, 50) }
    description     { Faker::Lorem.sentence }
    likes           { [true, false].sample }
  end

  factory :patient do
    first_name     { Faker::Name.first_name }
    last_name      { Faker::Name.last_name }
    nick_name      { Faker::Name.first_name }
    staff_id       { Faker::Number.between(1, 5) }
    beverage_type  { ["Water", "Water", "Water", "Water", "Water", "Thickened Water"].sample }
    mobility_type  { ["Walk", "Walk", "Walk", "walk", "Wheelchair"].sample }
    language       { ["English", "English", "English", "English", "French", "Arabic"].sample }
    request        { Faker::Lorem.sentence }
  end

  factory :volunteer do
    first_name     { Faker::Name.first_name }
    last_name      { Faker::Name.last_name }
  end

  factory :interaction do
    volunteer_id      { Faker::Number.between(1, 20) }
    patient_id        { Faker::Number.between(1, 50) }
    observation       { Faker::Lorem.sentence }
    walking_duration  { [0, 0, 0, Faker::Number.between(10,30)].sample }
    beverage          { [false, false, false, false, false, true].sample }
    time              { Faker::Time.backward(14, :day) }
  end
end