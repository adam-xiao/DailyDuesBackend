class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  has_secure_password

  field :username, type: String
  validates :username, presence: true
  validates :username, uniqueness: true
  
  field :password_digest, type: String
  validates :password_digest, :presence => true
  
  field :streak, type: Integer, default: 0
  field :daily_done, type: Mongoid::Boolean, default: false

  has_many :media, dependent: :destroy

end
