# Devise.setup do |config|
#   config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
#   require 'devise/orm/active_record'
#   config.case_insensitive_keys = [:email]

#   config.strip_whitespace_keys = [:email]

#   config.skip_session_storage = [:http_auth]

#   config.stretches = Rails.env.test? ? 1 : 12

#   config.reconfirmable = true

#   config.expire_all_remember_me_on_sign_out = true

#   config.password_length = 6..128

#   config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

#   config.reset_password_within = 6.hours

#   config.sign_out_via = :delete

#   config.responder.error_status = :unprocessable_entity
#   config.responder.redirect_status = :see_other

# end

Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  
  # Database authenticatable
  require 'devise/orm/active_record'
  
  # Remove/skip unnecessary Devise modules for API
  config.navigational_formats = [] # No need for navigational formats in API
  
  # Authentication
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  
  # Password
  config.stretches = Rails.env.test? ? 1 : 12
  config.password_length = 6..128
  
  # Email
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  
  # No need for these in API-only mode
  config.sign_out_via = :delete
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
end