class User < ActiveRecord::Base
  include SecureToken
  has_secure_password
  has_secure_token :auth_token

  has_many :tasks, dependent: :destroy
end
