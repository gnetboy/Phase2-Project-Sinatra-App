class FavoritesController < ApplicationController

  # GET: /favorites from all the users
  get "/all-favorites" do
    @favorites = Favorite.all
    erb :"/favorites/all.html"
  end
 # GET: /favorites
 get "/favorites" do
  @user = current_user
  @favorites = current_user.favorites
  redirect  "/users/#{current_user.id}"
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
          #redirect  "/users/#{current_user.id}"
     else 
      flash[:error]=favorite.errors.full_messages.to_sentence
      redirect "/favorites/new"
     end 
  end

  
  # GET: /favorites/5/edit
  get "/favorites/:id/edit" do
    
    @favorite=Favorite.find_by_id(params[:id])
      if @favorite.user == current_user
      erb :"/favorites/edit.html"
    else  
      flash[:error] = "Unable to perform that action"
      redirect "/favorites"
    end
  end

  # PATCH: /favorites/5
  patch "/favorites/:id" do
      @favorite=Favorite.find_by_id(params[:id])
      if @favorite.user == current_user
        if @favorite.update(params[:favorite])
          @favorite.save
         flash[:update] = "Success" #success message
         redirect "/users/show"#send to the /favorites/:id page
        else
          flash[:error] = "Unable to perform that action"#error message
          redirect "/favorites/edit.html"#redirect back to the edit form
        end
      end
  end
  

  # DELETE: /favorites/5/delete
  delete "/favorites/:id/delete" do
     @user = current_user
      @favorite = Favorite.find_by_id(params[:id])
        if @favorite.user == current_user
          if @favorite.destroy
          #success message
          flash[:deleted] = "Succesfully deleted"
          redirect  "/users/#{current_user.id}"
        else
      #   error message
        redirect  "/users/#{current_user.id}"
        end
    end
  end

  get "/favorites/:id" do
      @favorite=Favorite.find_by_id(params[:id])
      #should we check for ownership?
     # if @favorite.user == current_user if the conditonal is on I can only see all my favorites and not all the users favorites.
        erb :"/favorites/show.html"
      #else
       # redirect "/favorites"
      #end
  end

  end
