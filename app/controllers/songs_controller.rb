class SongsController < ApplicationController
  before_action :logged_in_user

  def index
    @songs = Song.all
  end


  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:success] = "Song successfully Added to the database"
      redirect_to songs_path
    else
      flash[:errors] = "Something went wrong"
      redirect_to songs_path
    end

  end

  def show
    @song = Song.find(params[:id])
  end

  private
  def song_params
    params.require(:song).permit(:artist, :title)
  end

end
