class ApplicationController < ActionController::Base
  before_action :store_location
  before_action :authenticate_user!

  def store_location
  	session[:previous_url] = request.fullpath unless (request.fullpath =~ /\/users/)
  end


  def after_sign_in_path_for(resource)
    if current_user.first_time
      current_user.first_time = false
      current_user.save
      flash[:warning] = "Atualize seus dados abaixo antes de prosseguir!"
      edit_user_registration_path
    else

      if session[:previous_url] 
        session[:previous_url]
      else
        root_path
      end
    end
  end
end
