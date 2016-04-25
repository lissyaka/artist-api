class AlbumsController < ApplicationController

  def index
    if params[:ids]
      render :json => { albums: Album.where(:id.in => params[:ids]) }
    else
      not_found
    end
  end
end
