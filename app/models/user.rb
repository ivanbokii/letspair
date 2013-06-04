class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  authenticates_with_sorcery!

  has_many :pairsessions

  attr_accessor :username_or_email
  attr_accessible :username, :email, :skills, :brief_info, :password, :password_confirmation, :image

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  validates :email, email: true

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long"
  validates_confirmation_of :password, :message => "should match confirmation"

  mount_uploader :image, AvatarUploader

  def self.get_last(number_of_users)
    self.order('created_at DESC').limit(5)
  end
end
