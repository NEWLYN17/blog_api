# app/controllers/concerns/authentication.rb
module Authentication
    extend ActiveSupport::Concern
  
    def authenticate_request!
      unless current_user
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  
    def current_user
      return @current_user if @current_user
  
      header = request.headers['Authorization']
      return nil unless header
  
      token = header.split(' ').last
      decoded = JsonWebToken.decode(token)
      @current_user = User.find_by(id: decoded['user_id']) if decoded
    end
  end