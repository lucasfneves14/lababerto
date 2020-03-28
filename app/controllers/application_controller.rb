class ApplicationController < ActionController::Base
  before_action :store_location
  before_action :authenticate_user!

  def store_location
  	session[:previous_url] = request.fullpath unless (request.fullpath =~ /\/users/)
  end


  def after_sign_in_path_for(resource)
    if session[:previous_url] 
      session[:previous_url]
    else
      root_path
    end
  end
end
