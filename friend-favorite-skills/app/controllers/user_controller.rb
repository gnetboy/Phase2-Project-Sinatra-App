class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    redirect "/favorites" if logged_in?
    erb :"/users/signup"
  end

  # POST: /users
  post "/signup" do
    user = User.create(params["user"])
    
    if user.valid?
      session["user_id"] = user.id
      flash[:message] = "Successfully created user!"
      redirect 'users/show'
    else
      flash[:message] = user.errors.full_messages.first
      redirect '/signup'
    end
  end
  
  get "/users/:id" do
    user = User.find_by_id(params[:id])
    if user == user
      erb :"users/show"
    else 
      redirect to "/favorites"
    end
  end



get "/users/:id/profile" do
  user = User.find_by_id(params[:id])
  if user == user
  erb :"users/profile"
  else 
    flash[:message] ="You do not have access!"
    redirect to "users/show"
end
end




end
