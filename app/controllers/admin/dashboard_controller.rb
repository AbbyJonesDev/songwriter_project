class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @songs = Song.all
  end
end
