class SessionsController < ApplicationController

    # GET: /sessions
    get "/login" do
      redirect "/favorites" if logged_in?
      erb :"/sessions/login"
    end
  
    # POST: /sessions
    post "/login" do
      current_user = User.find_by_email(params["user"]["email"])
      if current_user && current_user.authenticate(params["user"]["password"])
        session["user_id"] = user.id
        flash[:success] = "Successfully logged in!"
        redirect "/favorites/show"
      else
        flash[:error] = "Invalid credentials"
        redirect "/login"
      end
    end
  
    get "/logout" do
      session.clear
      redirect "/"
    end
  end
  