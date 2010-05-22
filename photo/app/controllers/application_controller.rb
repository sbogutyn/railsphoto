# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_user, :require_user

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UzytkownikSession.find
  end

  def current_user
    @current_user = current_user_session && current_user_session.record
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def require_user
    unless current_user
      store_location
      redirect_to login_path
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

end
