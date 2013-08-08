require 'faker'

def fake_timezone
  arr = ['Europe/Copenhagen', 'London', 'East Coast', 'Pacific', 'UTF/GMT +2',
         '-7']
  arr[rand(arr.length)]
end

FactoryGirl.define do
  factory :user do
    username                { Faker::Name.name }
    email                   { Faker::Internet.email }
    skills                  'Rails, Ruby'
    brief_info              nil
    password                'password'
    password_confirmation   'password'
    image                   nil
    timezone                { fake_timezone }
  end
end
