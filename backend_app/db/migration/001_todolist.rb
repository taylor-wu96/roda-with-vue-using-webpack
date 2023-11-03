# frozen_string_literal: true

# require 'sequel'

# Sequel.migration do
#   change do
#     create_table(:todos) do
#       primary_key :id
#       String :name, null: false
#       DateTime :due_date
#       Boolean :completed, default: false

#       timestamps
#     end
#   end
# end

# frozen_string_literal: true

require 'sequel'

Sequel.migration do
  change do
    create_table(:dramalists) do
      primary_key :id

      String :name, unique: true, null: false
      String :description, unique: true

      DateTime :created_date
      DateTime :updated_date
    end
  end
end
