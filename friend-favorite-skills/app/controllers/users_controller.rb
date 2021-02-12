class UsersController < ApplicationController


  # # GET: /users
  # get "/users" do
  #   erb :"/users/index.html"
  # end

  # # GET: /users/new
  # get "/users/new" do
  #   erb :"/users/new.html"
  # end

  # # POST: /users
  # post "/users" do
  #   redirect "/users"
  # end

  # # GET: /users/5
  # get "/users/:id" do
  #   erb :"/users/show.html"
  # end

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end

  get '/signup' do
    redirect to '/experiences' if is_logged_in?

    erb :"users/signup"
  end

  post '/signup' do
    user_info = { :name => params["name"],
                  :email => params["email"],
                  :password => params["password"] }

    is_empty?(user_info, 'signup')

    if User.find_by(:email => user_info[:email])
      flash[:account_taken] = "The email you provided is already in our system. Please enter a new email or log in to continue."
      redirect to '/signup'
    end

    new_user = User.create(user_info)
    session[:user_id] = new_user.id

    redirect to '/experiences'
  end

  get '/login' do
    redirect to '/experiences' if is_logged_in?

    erb :"users/login"
  end

  post '/login' do
    user_info = {
      :email => params["email"],
      :password => params["password"]
    }

    is_empty?(user_info, 'login')

    user = User.find_by(:email => user_info[:email])

    if user && user.authenticate(user_info[:password])
      session[:user_id] = user.id
      redirect to '/experiences'
    else
      if user
        flash[:password] = "Your password is incorrect"
        redirect to '/login'
      else
        flash[:no_account] = "There is no account associated with that email address. Please enter a different email or sign up for an account."
        redirect to '/login'
      end
    end
  end

  get '/logout' do
    if is_logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end