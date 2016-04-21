class Artist
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :itunes_id, type: String

  has_many :albums
  validates :name, presence: true
  validates :itunes_id, presence: true, uniqueness: true
end
