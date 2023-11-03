require './require_app'

# Rakefile
require 'dotenv/load'
require 'logger'

namespace :db do
  desc 'Migrate the database to the latest version'
  task :migrate do
    require('sequel')
    Sequel.extension :migration
    require_app(nil)
    # Set up the database connection
    db_url = ENV['DATABASE_URL']
    DB = Sequel.connect(db_url, logger: Logger.new($stderr))

    # Set up the migration path
    migration_path = File.expand_path('backend_app/db/migration', __dir__)
    print('migration_path:',migration_path)
    # Load the Rake tasks
    Dir.glob("#{migration_path}/*.rb").each { |file| require file }
    Sequel::Migrator.run(DB, migration_path)
  end

  desc 'Delete dev or test database file'
  task :drop do
    require_app(nil)
    Sequel.extension :migration
    @app = Todo::Api
    if @app.environment == :production
      puts 'Cannot wipe production database!'
      return
    end
    db_filename = "backend_app/db/store/#{@app.environment}.db"
    FileUtils.rm(db_filename)
    puts "Deleted #{db_filename}"
  end

end

