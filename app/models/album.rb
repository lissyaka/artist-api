class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :artwork_url_100, type: String
  
  belongs_to :artist
  validates :name, presence: true, uniqueness: true
  validates_associated :artist
end
