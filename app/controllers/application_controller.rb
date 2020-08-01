class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :logged_in?

  def logged_in?
    user_signed_in?
  end
end
