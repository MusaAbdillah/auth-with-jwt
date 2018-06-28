module ExceptionHandler 
	extend ActiveSupport::Concern

	# define custome error subclasses - rescue catches 'StandarsErrors'
	class AuthenticationError < StandardError; end 
	class MissingToken < StandardError; end 
	class InvalidToken < StandardError; end 

	included do 
		# define custome handler 
		rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two 
		rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request 
		rescue_from ExceptionHandler::RecordInvalid, with: :four_twenty_two 
		rescue_from ExceptionHandler::RecordInvalid, with: :four_twenty_two

		rescue_from ActiveRecord::RecordNotFound do |e|
			json_response({ message: e.message }, :not_found )
		end 
	end


	private 
		# JSON response with message; Status code 422 - unprocessable entity
		def four_twenty_two(e)
			json_response({ message: e.message }, :unprocessable_entity)
		end

		# JSOn response with message; Status code 401 - Unauthorized 
		def unauthorized_request(e)
			json_response({ message: e.message}, :unauthorized)
		end
end