require 'faker'

FactoryGirl.define do

  factory :valid_user do
    name      { Faker::Internet.name }
    email     { Faker::Internet.email }
    password  { Faker::Internet.password }
    role      'user'
    puts self
  end

end
