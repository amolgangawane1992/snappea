require_relative 'json_web_token'

class AuthenticateUser < ApplicationController
  #skip_before_action :authenticate_request

    def initialize(username, password_digest)
      @username = username
      @password_digest = password_digest
    end
  
    def call
      user
    end

    def user  
      begin
        
      @user = User.find_by("username":username,"password_digest":password_digest)
      puts @user
      if !@user.nil? && !@user.blank? 
       jwt = JsonWebToken.encode(user_id: @user.id) 
       @user.update_attributes(:token => jwt)
       return @user.token
     else
        raise "Error"
     end
       rescue Exception => e
       return e
      end
    end
    private
    attr_accessor :username, :password_digest
  end
