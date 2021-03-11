require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end
  

  get '/' do
    erb :"welcome"
  end

  get ['/signin', '/access'] do
    redirect '/login'
  end

  error Sinatra::NotFound do
    erb :"error.html"
  end

  helpers do
    def user
      @user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!user
    end

    def redirect_if_not_logged_in
        if !logged_in?
          redirect "/login" 
        end
    end

    def not_the_owner?(obj)
      if user != obj.user
        flash[:message] = "You do not have permission for that page!"
        redirect '/favorites' 
      end
    end

  end


  

end
