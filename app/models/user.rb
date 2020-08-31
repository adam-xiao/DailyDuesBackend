class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  has_secure_password

  field :username, type: String
  field :password_digest, type: String
  field :streak, type: Integer, default: 0
  field :daily_done, type: Mongoid::Boolean, default: false
end
