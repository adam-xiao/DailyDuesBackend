class Medium
  include Mongoid::Document
  field :title, type: String, default: "New Medium"
  
  field :link, type: String
  validates :link, presence: true

  field :archived, type: Mongoid::Boolean, default: false
  field :type, type: String, default: "None"
  field :purpose, type: String, default: "None"
  
  belongs_to :user
end
