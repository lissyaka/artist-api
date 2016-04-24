class ArtistsController < ApplicationController
 
  def index
    render :json => { artists: Artist.all }
  end

  def show_albums
    if artist = Artist.where(:id => params[:id]).first
      render :json => artist.albums
    else
      not_found
    end
  end 
end
