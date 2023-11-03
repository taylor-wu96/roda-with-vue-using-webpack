# frozen_string_literal: true

module Todo
  class TodoService
    # ...

    def create(todo)
      Todo.create(todo)
    end

    def update(id, todo)
      original = Todo[id]
      original.update(todo) if original
    end

    def delete(id)
      Todo[id].destroy if Todo[id]
    end
  end
end
