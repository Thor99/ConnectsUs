class HomeController < ApplicationController

	def index
		@search = params[:q]
		posts_searched = Post.search(@search)
		@posts_founded = posts_searched.all.page(params[:page]).per(4)
		@posts = Post.all.order("created_at DESC").page(params[:page]).per(4)
	end

end