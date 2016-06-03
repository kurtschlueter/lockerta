class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Helper methods in Rails are only available to the view, unlike the Sinatra framework
  # Moved #current_user to application_controller

  # Putting helper methods here and defining "helper_method" makes them accessible to ALL controllers & views

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    current_user.admin == true
  end

  helper_method :current_user
  helper_method :admin?

end
