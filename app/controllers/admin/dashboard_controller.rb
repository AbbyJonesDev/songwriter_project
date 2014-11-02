class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @songs = Song.all
    @articles = Article.article_list
  end

  def edit_account
    @admin = Admin.find(current_admin.id)
  end

  def update_account
    @admin = Admin.find(current_admin.id)
    if @admin.update_with_password(admin_params)
      sign_in(@admin, :bypass => true)
      flash[:notice] = "Account updated successfully"
      redirect_to(admin_path)
    else
      render action: 'edit_account'
    end
  end


  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, 
      :password_confirmation, :current_password)
  end
end
