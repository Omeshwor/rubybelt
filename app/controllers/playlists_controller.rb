class PlaylistsController < ApplicationController
  before_action :logged_in_user

  def new
    @playlist = UserPlaylist.new
  end

  def create
    @playlist = UserPlaylist.create(playlist_params)
    redirect_to songs_path
  end

  def destroy
    @playlist = UserPlaylist.find(params[:id])
    @like.destroy
    redirect_to songs_path
  end



  private
    def playlist_params
      params.require(:pl).permit(:song_id, :user_id)
    end

end
