class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :artwork_url_100, type: String
  
  belongs_to :artist
  validates :name, presence: true, uniqueness: true
  validates_associated :artist

  def as_json(options={})
  	{
  	  id: id.to_s,
  	  name: name,
  	  artwork_url_100: artwork_url_100,
  	  artist_id: artist_id
  	}
  end
end
