# config.ru
require './require_app'
require_app
run Todo::App.freeze.app
