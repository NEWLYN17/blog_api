# app/controllers/posts_controller.rb
class PostsController < ApplicationController
    before_action :authenticate_request!, except: [:index, :show]
    before_action :set_post, only: [:show, :update, :destroy]
  
    def index
      posts = Post.includes(:user)
      posts = posts.search_by_title(params[:query]) if params[:query].present?
      posts = posts.paginate(page: params[:page])
      render json: posts, include: :user
    end
  
    def show
      render json: @post, include: :user
    end
  
    def create
      post = current_user.posts.build(post_params)
      if post.save
        render json: post, status: :created
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      authorize @post
      if @post.update(post_params)
        render json: @post
      else
        render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      authorize @post
      @post.destroy
      head :no_content
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
  end