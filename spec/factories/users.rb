require 'faker'

FactoryGirl.define do
  factory :user do
    username                Faker::Name.name
    email                   Faker::Internet.email
    skills                  'Rails, Ruby'
    brief_info              nil
    password                'password'
    password_confirmation   'password'
    image                   nil
    timezone                '2013-07-31 16:00:00 +0200'
  end
end
