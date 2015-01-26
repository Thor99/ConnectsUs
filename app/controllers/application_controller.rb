class ApplicationController < ActionController::Base
  delegate :current_user, :user_signed_in?, to: :user_session
  helper_method :user_signed_in?, :current_user

  protect_from_forgery with: :exception

  before_action do
  	I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
  	{ locale: I18n.locale }
  end

  def user_session
	UserSession.new(session)  	
  end

  def require_authentication
  	unless user_signed_in?
  		redirect_to new_user_sessions_path, notice: "Aí mano, se loga aí pra fazer as paradas!"
  	end
  end

  def require_no_authentication
  	if user_signed_in?
  		redirect_to root_path, notice: "Já se encontra logado po"
  	end
  end

end
