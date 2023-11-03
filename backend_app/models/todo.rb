# frozen_string_literal: true

require 'sequel'
require 'json'
module Todo
  class Todo < Sequel::Model
    plugin :timestamps, update_on_create: true
    
    def to_json(options = {})
    JSON(
      {
        data: {
          type: 'todo',
          attributes: {
            id: id,
            name:name,
            due_date: due_date,
            completed: completed
          }
        }
      },
      options
    )
  end
  end
end
