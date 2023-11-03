# config.ru
require './backend_app/controllers/App'
run App.freeze.app
