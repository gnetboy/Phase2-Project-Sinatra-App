class FavoritesController < ApplicationController

  # GET: /favorites
  get "/favorites" do
    erb :"/favorites/favorites"
  end

  # GET: /favorites/new
  get "/favorites/new" do
    erb :"/favorites/new.html"
  end

  # POST: /favorites
  post "/favorites" do
     favorite = Favorite.create(params["favorite"])
     if favorite.valid?
          favorite.user_id = session["user_id"]
          favorite.save 
           redirect "/favorites/#{favorite.id}"
     else 
      flash[:error]=favorite.errors.full_messages.to_sentence
      redirect "/favorites/new"
     end 
  end

  # GET: /favorites/5
  get "/favorites/:id" do
    @favorite=Favorite.find_by_id(params[:id])
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
