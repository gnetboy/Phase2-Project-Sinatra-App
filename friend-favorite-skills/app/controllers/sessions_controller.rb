class SessionsController < ApplicationController

    # GET: /sessions
    get "/login" do
      redirect "/users/show" if logged_in?
      erb :"/sessions/login"
    end
  
    # POST: /sessions
    post "/login" do
      current_user = User.find_by_email(params["user"]["email"])
      if current_user && current_user.authenticate(params["user"]["password"])
        session["user_id"] = current_user.id
        flash[:message] = "Welcome, #{current_user.name}!"
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
  