# app/controllers/auth_controller.rb
class AuthController < ApplicationController
    def register
      user = User.new(user_params)
      if user.save
        token = JsonWebToken.encode(user_id: user.id)
        render json: { token: token, user: user.as_json(except: :password_digest) }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def login
      user = User.find_by(email: params[:email])
      if user&.valid_password?(params[:password])
        token = JsonWebToken.encode(user_id: user.id)
        render json: { token: token, user: user.as_json(except: :password_digest) }
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end
  