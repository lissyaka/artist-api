class ArtistsController < ApplicationController
 
  def index
    artists = Artist.all
    render :json => artists
  end

  def show_albums
    if artist = Artist.where(:id => params[:id]).first
      render :json => artist.albums
    else
      not_found
    end
  end 
end
