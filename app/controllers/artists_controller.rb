class ArtistsController < ApplicationController

  def index
    render :json => { artists: Artist.all }
  end

  def show
    if artist = Artist.where(:id => params[:id]).first
      render :json => { artist: artist }
    else
      puts Artist.where(:id => params[:id]).first
      not_found
    end
  end
end
