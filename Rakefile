require 'rake'
require 'sequel'
# require './require_app'
# require_relative 'app'

# namespace :db do
#   task :setup do
#     DB = Sequel.connect(ENV['DATABASE_URL'])

#     # Run migrations here
#   end

#   task :reset do
#     DB.tables.each { |table| DB.drop_table(table) }
#     Rake::Task['db:setup'].execute
#   end
# end
# require 'sequel/core'
# require 'sequel/migrations'

# Sequel.extension :migration

# namespace :db do
#   task :load_config do
#     require 'ruby-config/environment'
#   end

#   desc 'Run migrations'
#   task migrate: :load_config do
#     Sequel::Migrator.run(DB, '/backend_app/db/migrations')
#   end

#   desc 'Rollback last migration'
#   task :rollback do
#     Sequel::Migrator.run(DB, '/backend_app/db/migrations', target: -1)
#   end

# end

task :print_env do
  puts "Environment: #{ENV['RACK_ENV'] || 'development'}"
end

namespace :db do
  task :load do
    # require_app(nil) # load nothing by default
    # require_app

    Sequel.extension :migration
    require 'config/envirnoment'
    @app = Api
  end

  task :load_models do
    # require_app('models')
  end

  desc 'Run migrations'
  task migrate: %i[load print_env] do
    puts 'Migrating database to latest'
    Sequel::Migrator.run(@app.DB, 'backend_app/db/migrations')
  end

  # desc 'Destroy data in database; maintain tables'
  # task delete: :load_models do
  #   DramaConnect::DramaList.dataset.destroy
  # end

  desc 'Delete dev or test database file'
  task drop: :load do
    if @app.environment == :production
      puts 'Cannot wipe production database!'
      return
    end

    db_filename = "app/db/store/#{Api.environment}.db"
    FileUtils.rm(db_filename)
    puts "Deleted #{db_filename}"
  end
end
