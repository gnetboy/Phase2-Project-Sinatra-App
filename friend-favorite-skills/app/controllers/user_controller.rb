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
      flash[:message] = "Successfully created user!"
      session["user_id"] = user.id
      redirect 'users/show'
    else
      flash[:error] = user.errors.full_messages.first
      redirect '/signup'
    end
  end
  
  get "/users/:id" do
    user = User.find_by_id(params[:id])
    if current_user == user
    erb :"users/show"
    else redirect to "/favorites"
  end
end

end
