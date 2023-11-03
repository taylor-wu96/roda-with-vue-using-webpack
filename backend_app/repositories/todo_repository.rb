# frozen_string_literal: true

module Todo
  class TodoRepository
    def find_all
      Todo.all
    end

    def find(id)
      Todo[id]
    end

    def create(todo)
      Todo.create(todo)
    end

    def update(id, todo)
      Todo[id].update(todo)
    end

    def delete(id)
      Todo[id].delete
    end
  end
end
