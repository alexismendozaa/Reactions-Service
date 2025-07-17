require 'jwt'

class AuthenticationService
  def self.decode(token)
    secret_key = ENV['JWT_SECRET']
    decoded = JWT.decode(token, secret_key, true, { algorithm: 'HS256', verify_expiration: false })
    decoded.first['userId']  # Cambié 'user_id' por 'userId' para coincidir con el campo en el token
  rescue JWT::DecodeError
    nil
  end
end

