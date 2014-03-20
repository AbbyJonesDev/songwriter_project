require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  setup do
    @song = FactoryGirl.create(:song)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:songs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song" do
    assert_difference('Song.count') do
      post :create, song: { chords_file_name: @song.chords_file_name, chords_content_type: @song.chords_content_type, 
      chords_file_size: @song.chords_file_size, mp3_file_name: @song.mp3_file_name, mp3_content_type: @song.mp3_content_type,
      mp3_file_size: @song.mp3_file_size, title: @song.title, writeup: @song.writeup }
    end

    assert_redirected_to song_path(assigns(:song))
  end

  test "should show song" do
    get :show, id: @song
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song
    assert_response :success
  end

  test "should update song" do
    patch :update, id: @song, song: { chords_file_name: @song.chords_file_name, chords_content_type: @song.chords_content_type, 
      chords_file_size: @song.chords_file_size, mp3_file_name: @song.mp3_file_name, mp3_content_type: @song.mp3_content_type,
      mp3_file_size: @song.mp3_file_size, title: @song.title, writeup: @song.writeup }
    assert_redirected_to song_path(assigns(:song))
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete :destroy, id: @song
    end

    assert_redirected_to songs_path
  end
end
