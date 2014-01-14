class PostsController < ApplicationController
	def new
		@post = Post.new
	end
	
	#action to list all posts
	def index
		@posts = Post.all
	end
	
	#action to show content of a post
	def show
		@post = Post.find(params[:id])
	end
	
	#action to edit a post
	def edit
		@post = Post.find(params[:id])
	end
	
	#method to add new record into the database
	def create
		@post = Post.new(params[:post].permit(:title, :text))
		
		if @post.save
		
			#tell browser to issue anothe request
			redirect_to @post
		else
		
			#render is used so that @post is passed back to the
			#new template when it is rendered
			render 'new'
		end
	end
	
	#method to update an existing record
	#accepts hash containing attributes the we want to update
	def update
		@post = Post.find(params[:id])
		
		if @post.update(params[:post].permit(:title, :text))
			redirect_to @post
		else
			render 'edit'
		end
	end
	
	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
