require './require_app'

# task :print_env do
#   puts "Environment: #{ENV['RACK_ENV'] || 'development'}"
# end

# namespace :db do
#   task :load do
#     require 'sequel'
#     Sequel.extension :migration
#     # require 'config/environment'
#     require_app(nil)
#     def app = Todo::Api
#   end

#   desc 'Run migrations'
#   task migrate: %i[load print_env] do
#     puts 'Migrating database to latest'
#     puts(app.DB)
#     # Sequel::Migrator.run(App.DB, 'backend_app/db/migrations')
#     # DB = Sequel.sqlite('Users/wufengjin/Desktop/VueMonolith/roda/backend_app/db/store/development.db')
#     Sequel::Migrator.run(app.DB, './backend_app/db/migrations')
#   end

#   # desc 'Destroy data in database; maintain tables'
#   # task delete: :load_models do
#   #   DramaConnect::DramaList.dataset.destroy
#   # end

#   desc 'Delete dev or test database file'
#   task drop: :load do
#     if @app.environment == :production
#       puts 'Cannot wipe production database!'
#       return
#     end

#     db_filename = "app/db/store/#{Api.environment}.db"
#     FileUtils.rm(db_filename)
#     puts "Deleted #{db_filename}"
#   end
# end

# Rakefile

require 'sequel'
require 'dotenv/load'
require 'logger'
require 'roda'
require 'logger'

# Load the environment variables
Dotenv.load



# Define the Rake tasks
namespace :db do
  desc 'Migrate the database to the latest version'
  task :migrate do
    Sequel.extension :migration
    require_app(nil)
    # Set up the database connection
    db_url = ENV['DATABASE_URL'] || 'sqlite://backend_app/db/store/development.db'
    DB = Sequel.connect(db_url, logger: Logger.new($stderr))

    # Set up the migration path
    migration_path = File.expand_path('backend_app/db/migration', __dir__)
    print('migration_path:',migration_path)
    # Load the Rake tasks
    Dir.glob("#{migration_path}/*.rb").each { |file| require file }
    Sequel::Migrator.run(DB, migration_path)
  end

  desc 'Rollback the database to a previous version'
  task rollback: :environment do
    Sequel::Migrator.run(DB, migration_path, target: 0)
  end

  desc 'Create a new migration file'
  task :create_migration, [:name] do |_, args|
    Sequel::Migrator.create_migration(migration_path, args[:name])
  end
end

task :environment do
  require './config/environment.rb'
end
