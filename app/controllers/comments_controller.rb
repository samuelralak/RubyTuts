class CommentsController < ApplicationController

	#only allow authenticated users to delete comments
	http_basic_authenticate_with name: "samuel", password: "ralak", only: :destroy

	#action to create a new comment
	def create
	
		#request for a comment has to keep track of the post
		#to which the comment is attached
	
		#get the post in question
		@post = Post.find(params[:post_id])
		
		#create method creates and saves comment in database
		@comment = @post.comments.create(params[:comment].permit(:commenter, :body))
		
		#send user back to original post
		redirect_to post_path(@post)
	end
	
	#action to delete a comment
	def destroy
	
		#find the post in question
		@post = Post.find(params[:post_id])
		
		#locate the comment in question within the @post.comments collection
		@comment = @post.comments.find(params[:id])
		
		#remove comment from the database
		@comment.destroy
		
		#send user back to original post
		redirect_to post_path(@post)
	end
end
