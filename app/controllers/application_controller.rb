class ApplicationController < ActionController::API
	include ActionController::HttpAuthentication::Token::ControllerMethods

	private
	def restrict_access
		unless restrict_access_to_user
			render json:{'message' => 'Invalid Api tokken' },status: :unauthorized
			return 
		end
		@current_user = @identity.user if @identity
	end

	def restrict_access_to_user
		authenticate_or_request_with_http_token do |token, options| 
			if  Identity.exists?(token: token)
				@identity = Identity.find_by_token token
			end
		end
	end
end
