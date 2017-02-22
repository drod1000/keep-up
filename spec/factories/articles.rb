FactoryGirl.define do
  factory :article do
    url Faker::Internet.url
    title Faker::Name.title
    author Faker::Book.author
    body Faker::Lorem.paragraph
  end
end
