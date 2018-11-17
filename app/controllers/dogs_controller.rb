require 'apiCall'
class DogsController < ApplicationController
    
    def saved
        @dogs = User.find(session[:userid]).saved_dogs
    end

    def save_id
        dog = session[:dog]
        p '==============='
        p dog['breeds'][0]['name']
        p dog['id']
        p '================='

        newdog = SavedDog.create(name:dog['breeds'][0]['name'], api_id: dog['id'], user_id: session[:userid])
        redirect_to '/users/find'
    end

    def find
        p params[:idapi]
        dog = ObjectClass.new
        @dog = dog.getOne(params[:idapi])
        p @dog
    end


end
