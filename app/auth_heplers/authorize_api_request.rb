require_relative 'json_web_token'
class AuthorizeApiRequest
  
    def initialize(headers = {})
      @headers = headers
    end
  
    def call
      p "somdijsfb"
      user
    end

    def user
      @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    end
  
    def decoded_auth_token
      puts "decode method"
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end
  
    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
      else
      nil
    end
    end
  private
    attr_reader :headers
  end
  