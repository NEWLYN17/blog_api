class LikesController < ApplicationController
    before_action :authenticate_request!
  
    def create
      post = Post.find(params[:post_id])
      like = current_user.likes.build(post: post)
      
      if like.save
        render json: { message: 'Post liked successfully' }, status: :created
      else
        render json: { errors: like.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      like = current_user.likes.find_by!(post_id: params[:post_id])
      like.destroy
      head :no_content
    end
  end
  
  