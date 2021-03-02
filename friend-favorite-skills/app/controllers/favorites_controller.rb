class FavoritesController < ApplicationController

  # GET: /favorites
  get "/favorites" do
    @user = current_user
    erb :"/favorites/favorites"
  end

  # GET: /favorites/new
  get "/favorites/new" do
    erb :"/favorites/new.html"
  end

  # POST: /favorites
  post "/favorites" do
    fav = Favorite.create(params["favorite"])
    redirect "/favorites/#{fav.id}"
    binding.pry
  end

  # GET: /favorites/5
  get "/favorites/:id" do
    @user=current_user
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
