class PostsController < ApplicationController
	def new
	
	end
	
	#action to list all posts
	def index
		@posts = Post.all
	end
	
	#action to show content of a post
	def show
		@post = Post.find(params[:id])
	end
	
	#action to create new post
	def create
		@post = Post.new(post_params)
		
		@post.save
		redirect_to @post
	end
	
	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
