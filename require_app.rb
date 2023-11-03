# frozen_string_literal: true

def require_app
  require './config/envirnoment'
  # require './backend_app/db/migration/001_todolist'
  Dir['./backend_app/**/*.rb'].each { |file| puts(file) }
  Dir['./backend_app/**/*.rb'].each { |file| require file }
end

require_app
