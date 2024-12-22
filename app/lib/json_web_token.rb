# app/lib/json_web_token.rb
class JsonWebToken
    def self.encode(payload)
      JWT.encode(payload, ENV['JWT_SECRET_KEY'])
    end
  
    def self.decode(token)
      JWT.decode(token, ENV['JWT_SECRET_KEY']).first
    rescue JWT::DecodeError
      nil
    end
  end