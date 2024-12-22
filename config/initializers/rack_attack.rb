# config/initializers/rack_attack.rb
class Rack::Attack
    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  
    throttle('auth/ip', limit: 5, period: 60.seconds) do |req|
      req.ip if req.path =~ /\/auth\/(login|register)/ && req.post?
    end
  end