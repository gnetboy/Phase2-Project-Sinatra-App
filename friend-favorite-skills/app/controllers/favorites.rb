class FavoritesController < ApplicationController

  # GET: /favorites
  get "/favorites" do
    @user = current_user
    @favorites = @user.favorites.all
    erb :"/favorites/favorites"
  end

  # GET: /favorites/new
  get "/favorites/new" do
    @categories=Category.all
    erb :"/favorites/new.html"
  end

  # POST: /favorites
  post "/favorites" do 

    details = {
      :description => @params["description"],
      :category => @params["category"]
    }

    @favorite = Favorite.create_new(details,session[:user_id])

    flash[:success] = "Successfully added!"
    redirect to "favorites/#{@favorite.id}"
  
  end

  # GET: /favorites/5
  get "/favorites/:id" do
    current_user
    @favorite =Favorite.find(params["id"])
    erb :"/favorites/show.html"
  end

  # GET: /favorites/5/edit
  get "/favorites/:id/edit" do
    erb :"/favorites/edit.html"
  end

  # PATCH: /favorites/5
  patch "/favorites/:id" do
    redirect "/favorites/:id"
  end

  # DELETE: /favorites/5/delete
  delete "/favorites/:id/delete" do
    redirect "/favorites"
  end
end
