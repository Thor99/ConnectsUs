class PostsController < ApplicationController
	before_action :require_authentication, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_users_post, only: [:edit, :update, :destroy]
	before_action :set_post, only: [:show]

	def show
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(posts_params)

		if @post.save
			redirect_to @post, notice: "Post criado com sucesso!"
		else
			render action: :new
		end
	end

	def edit
	end

	def update

		if @post.update(posts_params)
			redirect_to @post, notice: "Post atualizado com sucesso!"
		else
			render action: :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to root_url
	end


	private


	def set_post
		@post = Post.friendly.find(params[:id])
		@comments = @post.comments.order("created_at DESC")
	end

	def set_users_post
		@post = current_user.posts.friendly.find(params[:id])
	end

	# usei as funções set_post e set_users_post para escrever menos código, mas não tem muito a ver com segurança

	def posts_params
		params.require(:post).permit(:title, :description)
	end
end