class PostsController < ApplicationController
	load_and_authorize_resource
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:show, :index]


	def index
		
		@posts = Post.order(:id).page(params[:page])
	end

	def new
		@post = Post.new

	end

	def create
       @post = Post.new(post_params)
       @post.user = current_user

       if @post.save
       	redirect_to @post

       else
       	render 'new'

       end
	end

	def show
	end

	def update

		if @post.update(post_params)

			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
	end

	def destroy
		@post.destroy

		redirect_to posts_path
		
	end


	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params

		params.require(:post).permit(:title, :content)

	end

end
