class JsonWebToken 
	# secret to encode and decode token 
	HMAC_SECRET = Rails.application.secrets.secret_key_base

	def self.encode(payload, exp = 24.hours.from_now)
		# set expiry to 24 hours from creation time 
		payload[:exp] = exp.to_i
		# sing token with application secret 
		JWT.encode(payload, HMAC_SECRET) 
	end

	def self.decode(token)
		# get paylod, first index in decode array 
		body = JWT.decode(token, HMAC_SECRET)[0]
		HashWithIndifferentAccess.new(body)
		# rescue from all decode erros
		rescue JWT::DecodeError => e 
		# raise custome error to be handled by custome handler 
			raise ExceptionHandler::InvalidToken, e.message
		end
	end
end