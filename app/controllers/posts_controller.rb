class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_post, only: [:edit, :update, :show, :destroy]

	def index
		@posts = Post.all.order('created_at DESC')
	end	

	def new
		@post = Post.new
	end
	
	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post, success: 'Статья успешно создана.'
		else
			render :new, danger: 'Статья не создана!'
		end	
	end

	def edit
		
	end
	
	def update

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post, success: 'Статья успешно обновлена.'
		else
			render :edit, warning: 'Статья не обновлена!'
		end	
	end	

	def show
		
	end	

	def destroy
		@post.destroy

		redirect_to root_path, danger: 'Статья удалена'
	end	

	private

		def set_post
			@post = Post.find(params[:id])
		end	

		def post_params
			params.require(:post).permit(:title, :body)
		end	

end
