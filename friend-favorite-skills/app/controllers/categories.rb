class CategoriesController < ApplicationController
  
  
  before '/categories/*' do
    if !is_logged_in?
      flash[:login] = "You need to be logged in to performance that action"
      redirect to '/login'
    end
  end

  get '/categories' do
    if !is_logged_in?
      flash[:login] = "You need to be logged in to performance that action"
      redirect to '/login'
    end
    @categories = Category.all.sort_by{|c| c.name}
    erb :"categories/categories"
  end

  get '/categories/:id' do
    @category = Category.find(params["id"])
    erb :"categories/show"
  end

end
