# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

joe = User.create!({
  username:                'Joe Smith',  
  email:                   'joe@example.com',
  skills:                  'Rails, Ruby',
  brief_info:              nil,
  password:                'password',
  password_confirmation:   'password',
  image:                   nil,
  timezone:                '2013-07-31 16:00:00 +0200'
})

mark = User.create!({
  username:                'mjones',  
  email:                   'mark@example.com',
  skills:                  'Bash, Git',
  brief_info:              nil,
  password:                'password',
  password_confirmation:   'password',
  image:                   nil,
  timezone:                '2013-07-31 13:00:00 -0700'
})