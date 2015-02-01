class HomeController < ApplicationController

	def index
		@posts = Post.all.order("created_at DESC").page(params[:page]).per(4)
	end

end