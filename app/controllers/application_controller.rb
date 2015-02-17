class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate
  
  def authenticate
    token_authenticate or basic_authenticate or render_unauthorized
  end

  def current_user
    @current_user
  end

  protected

  def token_authenticate
    @current_user = authenticate_with_http_token { |token, option| User.find_by(auth_token: token) }
  end

  def basic_authenticate
    @current_user = authenticate_with_http_basic { |email, pass| User.find_by(email: email).try(:authenticate, pass)  }
  end

  def render_unauthorized
    headers['WWW-Authenticate'] = 'Token realm="Application"'
    respond_to do |format|
      format.json { render json: "", status: :unauthorized }
    end
  end


  def services
    Rails.application.config.services
  end
end
