require 'sequel'
require 'dotenv/load'
require 'roda'

class Api < Roda
  plugin :environments

  db_url = ENV['DATABASE_URL'] || 'sqlite://backend_app/db/development.db'

  DB = Sequel.connect(db_url)
  def self.DB = DB
end
