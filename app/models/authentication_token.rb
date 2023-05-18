class AuthenticationToken < ApplicationRecord
  has_secure_token :auth_token, length: 50
end
