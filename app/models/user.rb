class User < ApplicationRecord
	 # has_secure_password
	  # has_secure_token :password_reset_token

	   validates :username, presence: true
	   validates :password_digest, presence: true
	   validates :email, presence: true
	  # validates :token, presence: true
end

