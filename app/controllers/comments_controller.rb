class CommentsController < ApplicationController
	load_and_authorize_resource
	before_action :authenticate_user!
	

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to @post
		else
			redirect_to @post, notice: "comment not saved"
		end
		
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])


		@comment.user_id = current_user.id

		if @comment.update(comment_params)

			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
		@post = Post.find(params[:id])
		@comment = Comment.find(params[:post_id])
	end

	def destroy
        @post = Post.find(params[:id])
        @comment = Comment.find(params[:post_id])

		@comment.destroy

		redirect_to @post
	end 


	private



	def comment_params

		params.require(:comment).permit(:body)
		
 end
end
