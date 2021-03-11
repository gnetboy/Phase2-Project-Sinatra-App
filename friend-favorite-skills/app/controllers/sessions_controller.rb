class SessionsController < ApplicationController

    # GET: /sessions
    get "/login" do
      redirect "/users/show" if logged_in?
      erb :"/sessions/login"
    end
  
    # POST: /sessions
    post "/login" do
      user = User.find_by_email(params["user"]["email"])
      if user && user.authenticate(params["user"]["password"])
        session["user_id"] = user.id
        flash[:message] = "Welcome, #{user.name}!"
        redirect "users/show"
      else
        flash[:message] = "Invalid credentials"
        redirect "/login"
      end
    end
  
    get "/logout" do

      session.clear
      flash[:message] = "Thanks for visiting!"
      redirect "/"
    end
  end
  