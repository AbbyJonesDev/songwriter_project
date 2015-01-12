class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.with_chord_charts
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = "Song was successfully created"
      redirect_to @song
    else
      # Prevent Paperclip from producing duplicate errors
      @song.errors.delete(:chords) && @song.errors.delete(:mp3) 
      render action: 'new'
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    @song = Song.find params[:id]
    if @song.update(song_params)
      flash[:notice] = "Song was successfully updated"
      redirect_to @song
    else
      # Prevent Paperclip from producing duplicate errors
      @song.errors.delete(:chords) && @song.errors.delete(:mp3)
      render action: "edit"
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer == admin_url ? admin_path : songs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :writeup, :mp3, :chords)
    end
end
