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
      flash[:success] = "Successfully created user!"
      session["user_id"] = user.id
      redirect '/favorites/favorites'
    else
      flash[:error] = user.errors.full_messages.first
      redirect '/signup'
    end
  end
  get "/users/:id" do
    erb :"users/show"
  end

end

# post '/signup' do
#   user_info = { :name => params["name"],
#                 :email => params["email"],
#                 :password => params["password"] }

#   is_empty?(user_info, 'signup')

#   if User.find_by(:email => user_info[:email])
#     flash[:account_taken] = "The email you provided is already in our system. Please enter a new email or log in to continue."
#     redirect to '/signup'
#   end

#   current_user = User.create(hash)
#   session[:user_id] = new_user.id

#   redirect to '/'
# end