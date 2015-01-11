class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_device_type

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

private 
  def set_device_type
    case request.user_agent
      when /iPad/i
        request.variant = :tablet
      when /iPhone/i
        request.variant = :phone
      when /Android/i && /mobile/i
        request.variant = :phone
      when /Android/i
        request.variant = :tablet
      when /Windows Phone/i
        request.variant = :phone
      else
        request.variant = :desktop
    end
  end

end
