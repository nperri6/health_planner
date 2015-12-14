class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email, :password_digest, :firstname, :lastname, :birthday
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :username, :email
  has_many :appointments

end
