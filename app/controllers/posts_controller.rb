class PostsController < ApplicationController
	
	before_action :set_post , :only => [:show,:edit,:update,:destroy]
  before_action :authenticate_user!

	def index
		@posts = Post.all.order("created_at DESC").page(1).per(10)
	end

	def show
	end


	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			 redirect_to post_path(@post)
			 flash[:notice] = "救災文張新增成功"
		else
			render new_post_path(@post)
		end
	end

	def edit
  end
	

	def update
		if @post.update(post_params)
			redirect_to posts_path
			flash[:notice] = "文章修改成功"
		else
			render edit_post_path(@post)
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
		flash[:notice] = "文章刪除成功"
	end
end

private

def post_params
	params.require(:post).permit(:title , :content)
end	

def set_post
	@post = Post.find(params[:id])
end