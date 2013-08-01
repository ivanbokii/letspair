class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username

  authenticates_with_sorcery!

  has_many :pairsessions

  attr_accessor :username_or_email
  attr_accessible :username, :email, :skills, :brief_info, :password, :password_confirmation, :image, :timezone

  validates_presence_of :username, :email, :timezone
  validates_uniqueness_of :username, :email

  validates :email, email: true

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", if: :should_validate_password?
  validates_confirmation_of :password, :message => "should match confirmation", if: :password

  def should_validate_password?
    new_record?
  end

  mount_uploader :image, AvatarUploader

  def self.get_last(number_of_users)
    self.order('created_at DESC').limit(number_of_users)
  end
end
