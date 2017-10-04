module Api
	class AuthenticationsController < ApplicationController
		skip_before_action :authenticate_request 

		def authenticate
			auth_token = AuthenticateUser.new(params[:username], params[:password_digest]).call
			if auth_token.present?
				render json: { token: auth_token}
			else 
			 	render json: { error: "token not generated" }, status: :unauthorized 
			end 
		end 
	end
end
