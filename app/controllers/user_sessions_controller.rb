class UserSessionsController < ApplicationController
	before_filter :require_no_authentication, only: [:new, :create]
	before_filter :require_authentication, only: [:destroy]
	def new
		@user_session = UserSession.new(session)
	end

	def create
		@user_session = UserSession.new(session, params[:user_session])

		if @user_session.authenticate!
			redirect_to root_path, notice: "Usuário logado com sucesso! Bem vindo de volta #{current_user.name}!"
		else
			render :new
		end
	end

	def destroy
		user_session.destroy
		redirect_to root_path, notice: "Logout realizado com sucesso!"
	end
end