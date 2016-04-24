class Artist
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :itunes_id, type: String

  has_many :albums
  validates :name, presence: true
  validates :itunes_id, presence: true, uniqueness: true

  def as_json(options={})
  	{
  		id: id.to_s,
  		name: name,
  		itunes_id: itunes_id,
      albums: albums.map { |a| a.id.to_s }
  	}
  end
end
