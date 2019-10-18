class PlaylistsController < ApplicationController
  def new
    @playlist = UserPlaylist.new
  end

  def create
    @playlist = UserPlaylist.new(playlist_params)
    if @playlist.save
      flash[:success] = "Added successfully"
      redirect_to songs_path
    else
      flash[:error] = "Unable to add"
      redirect_to songs_path
    end
  end


  private
    def playlist_params
      params.require(:pl).permit(:song_id, :user_id)
    end

end
