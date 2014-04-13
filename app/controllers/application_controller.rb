class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin) 
      admin_path
    else
      super
    end    
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
