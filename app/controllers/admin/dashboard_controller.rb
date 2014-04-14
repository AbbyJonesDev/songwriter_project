class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @songs = Song.all
  end

  def edit_account
    @admin = Admin.find(current_admin.id)
  end

  def update_account
    @admin = Admin.find(current_admin.id)
    if @admin.update(admin_params)
      flash[:notice] = "Account updated successfully"
      redirect_to(admin_path)
    else
      render action: 'edit_account'
    end
  end


  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
end
