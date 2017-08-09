class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :destroy, :update]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def edit
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render 'new'
    end
  end

  def update
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  def find_song
    @song = Song.find(params[:id])
  end

  private
  def song_params
    params.require(:song).permit(:title, :artist)
  end
end
