require 'rubygems'
require 'httparty'

desc "Fetching data from Itunes"
task :artist,  [:name] => :environment do |t, args|
  resp_artist = JSON.parse(HTTParty.get("https://itunes.apple.com/search?term=#{args[:name]}&entity=musicArtist"))
  puts "There is no such artist" if resp_artist["resultCount"] == 0

  resp_artist["results"].each do |i|
    name = i["artistName"]
    itunes_id = i["artistId"]

    artist = Artist.new(:name => name, :itunes_id => itunes_id)
    
    if artist.save
      puts "Successfully created #{artist.name}"
    else 
      puts "Unable to create artist, #{artist.name}: #{artist.errors.full_messages.join(", ")}"
    end
    
    if Artist.where(:itunes_id => itunes_id).first
       fetch_albums(itunes_id, artist)
    end
  end
end

def fetch_albums(itunes_id, artist)
  resp_album = JSON.parse(HTTParty.get("https://itunes.apple.com/lookup?id=#{itunes_id}&entity=album"))
      
  resp_album["results"].each do |j|
    next if j["wrapperType"] == "artist"
    name = j["collectionName"]
    artwork_url_100 = j["artworkUrl100"]
    album = Album.create(:name => name, :artwork_url_100 => artwork_url_100, :artist => artist) 
  end
end
