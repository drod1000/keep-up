FactoryGirl.define do
  factory :list do
    name Faker::Name.title
    user
  end
end
