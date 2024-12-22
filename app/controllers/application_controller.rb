# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
    include Authentication
    include Pundit::Authorization
  
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
    private
  
    def user_not_authorized
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  
    def not_found
      render json: { error: 'Resource not found' }, status: :not_found
    end
  end