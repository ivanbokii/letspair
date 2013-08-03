FactoryGirl.define do
  factory :user do
    username                'Joe Smith'  
    email                   'joe@example.com'
    skills                  'Rails, Ruby'
    brief_info              nil
    password                'password'
    password_confirmation   'password'
    image                   nil
    timezone                '2013-07-31 16:00:00 +0200'
  end
end