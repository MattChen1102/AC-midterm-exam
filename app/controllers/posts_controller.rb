class PostsController < ApplicationController
	
	before_action :set_post , :only => [:show,:edit,:update,:destroy]
  before_action :authenticate_user!

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
	end


	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			 redirect_to post_path(@post)
		else
			render new_post_path(@post)
		end
	end

	def edit
  end
	

	def update
		if @post.update(post_params)
			redirect_to posts_path
		else
			render edit_post_path(@post)
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end
end

private

def post_params
	params.require(:post).permit(:title , :content)
end	

def set_post
	@post = Post.find(params[:id])
end