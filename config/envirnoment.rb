require 'sequel'
require 'dotenv/load'
require 'roda'
require 'logger'
# Sequel.connect(ENV.fetch("DATABASE_URL"), logger: Logger.new($stderr))
module Todo
  class Api < Roda
    # plugin :environments

    db_url = 'sqlite://backend_app/db/store/development.db'

    # db_url = ENV['DATABASE_URL'] || 'sqlite://backend_app/db/store/development.db'
    puts(db_url)

    # DB = Sequel.connect(db_url, logger: Logger.new($stderr))
    DB = Sequel.connect(db_url)
    def self.DB = DB # rubocop:disable Naming/MethodName
  end
end
