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
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!@current_user
    end

    def redirect_if_not_logged_in
        redirect "/login" if !logged_in?
    end

    def not_the_owner?(obj)
      if current_user != obj.user
        flash[:error] = "You do not have permission for that page!"
        redirect '/favorites' 
      end
    end

  end


  

end
