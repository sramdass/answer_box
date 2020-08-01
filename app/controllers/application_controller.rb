class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  #FIXME - Is this correct?

  # protect_from_forgery with: :null_session, if: :json_request?
  # protect_from_forgery with: :exception, unless: :json_request?
  before_action :authenticate_user!
  helper_method :logged_in?

  def logged_in?
    user_signed_in?
  end

  def json_request?
    request.format.json?
  end
end
