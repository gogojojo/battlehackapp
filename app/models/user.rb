class User < ActiveRecord::Base
  include ActiveModel::SecurePassword
  has_many :events
  has_secure_password

end
