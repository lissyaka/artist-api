class Artist
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :itunes_id, type: String

  has_many :albums
  # TODO: do we need uniqueness on name?
  validates :name, presence: true, uniqueness: true
  validates :itunes_id, presence: true, uniqueness: true
end
