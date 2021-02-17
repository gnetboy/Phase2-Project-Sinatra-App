require './config/environment'


use Rack::MethodOverride
use CategoriesController
use FavoritesController
use UserController
run ApplicationController
