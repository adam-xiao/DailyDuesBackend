class Medium
  include Mongoid::Document
  field :title, type: String, default: "New Medium"
  field :link, type: String
  field :archived, type: Mongoid::Boolean, default: false
  field :type, type: String
  field :purpose, type: String
  belongs_to :user
end
