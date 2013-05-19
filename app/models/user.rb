class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessor :username_or_email
  
  attr_accessible :username, :email, :skills, :brief_info, :password, :password_confirmation

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
end
