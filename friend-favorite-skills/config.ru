require './config/environment'


use Rack::MethodOverride
run ApplicationController
use SessionsController
use FavoritesController
use UsersController
