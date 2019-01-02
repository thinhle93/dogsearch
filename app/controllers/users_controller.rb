require 'rubygems'
require 'httparty' 
require 'apiCall'



class UsersController < ApplicationController

    skip_before_action :require_login, only: [:index,:registerpage, :login, :register]
  def index
    # character = HTTParty.get('https://swapi.co/api/people/1/')
    # @name = character['name']

    # p '-------======='
    # p @name

    #calling api using class method
    # character = ObjectClass.new
    # @nsw = character.getapi[0]['breeds'][0]
    
    
    # p @nsw
    # nsw.each do |v|
    #   p v['breeds'][0]['name']
    # end
    
  end

  def register
    user = User.create(user_params)
        
        if !user.valid?
            flash[:errors] = user.errors.full_messages
            # if user_params[:password] != user_params[:password_confirmation]
            #     puts user_params[:password]
            #     puts user_params[:password_confirmation]
            #     flash[:errors] << "Passwords do not match!"
            # end
            redirect_to "/users/registerpage"
        else
            
            session[:userid] = user.id
            redirect_to "/users/find"
        end
  end

  def usershow
    @user = User.find(session[:userid])

     #calling api using class method
    character = ObjectClass.new
    @nsw = character.getapi
    session[:dog] = @nsw[0]
    # p session[:dog]
   
    
  end

  def login
    u = User.find_by(email: params[:email])
        
        if u && u.authenticate(params[:password])
            session[:userid] = u.id 
            redirect_to "/users/find"
        else
            flash[:errors] = ["Invalid Log in"]
            redirect_to "/"
        end 
  end

  def logout
    session[:userid] = nil
    redirect_to '/'
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
