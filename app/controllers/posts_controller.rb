class PostsController < ApplicationController
	
	#renders new.html.erb: contains form for creating new post
	def new
		@post = Post.new
	end
	
	#action to list all posts
	def index
		@posts = Post.all
	end
	
	#action to show content of a post; renders show.html.erb
	def show
		@post = Post.find(params[:id])
	end
	
	#action to edit a post; renders edit.html.erb
	def edit
		@post = Post.find(params[:id])
	end
	
	#method to add new post into the database
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
			#@post is passed back to the edit template
			#when it is rendered
			render 'edit'
		end
	end
	
	#method to delete a record from the database
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		
		redirect_to posts_path
	end
	
	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
