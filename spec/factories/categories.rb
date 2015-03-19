# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :category do
    name { Faker::Lorem.word }
    page_title { Faker::Lorem.word }
  end
end
