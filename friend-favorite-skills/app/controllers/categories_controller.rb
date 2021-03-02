class CategoriesController < ApplicationController

  # GET: /categories
  get "/categories" do
    erb :"/categories/index.html"
  end

  # GET: /categories/new
  get "/categories/new" do
    erb :"/categories/new.html"
  end

  # POST: /categories
  post "/categories" do
    redirect "/categories"
  end

  # GET: /categories/5
  get "/categories/:id" do
    erb :"/categories/show.html"
  end

  # GET: /categories/5/edit
  get "/categories/:id/edit" do
    erb :"/categories/edit.html"
  end

  # PATCH: /categories/5
  patch "/categories/:id" do
    redirect "/categories/:id"
  end

  # DELETE: /categories/5/delete
  delete "/categories/:id/delete" do
    redirect "/categories"
  end
end
