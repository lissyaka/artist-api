class AlbumsController < ApplicationController
 
  def index
    if artist = Artist.where(:id => params[:id]).first
      render :json => { albums: artist.albums }
    else
      not_found
    end
  end

  def show
    if album = Album.where(:id => params[:id]).first
      render :json => { album: album }
    else
      not_found
    end
  end
end
