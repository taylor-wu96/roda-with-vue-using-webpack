require 'roda'
require 'json'

module Todo
  # Web controller for Todo
  class App < Roda
    plugin :render
    plugin :assets, js: ['main.bundle.js'], path: 'dist/'
    plugin :public, root: 'dist'

    plugin :all_verbs
    plugin :halt
    route do |r|
      r.assets
      r.public

      r.on 'todos' do
        r.post do
          # todo = JSON.parse(r.params)
          data= JSON.parse(r.body.read)
          puts('data',data)
          # Call the method with the correct number of arguments
          todo = Todo.create(data)
          response.status = 201
          todo.to_json
          # r.redirect '/todos'
        end
        r.get String do |todo_id|
          response['Content-Type'] = 'application/json'
          output = { data: Todo.first(id: todo_id)}
          response.status = 200
          JSON.pretty_generate(output)
        end
        r.get do
          response['Content-Type'] = 'application/json'
          puts('Todo.all', Todo.all)
          output = { data: Todo.all }
          response.status = 200
          JSON.pretty_generate(output)
        end

        r.delete String do |id|
          Todo.where(id: id).delete 
          # Todo.delete(id)
          response['Content-Type'] = 'application/json'
          response.status = 200
          JSON.pretty_generate({ success: true, message: 'delete the todo' })
        # rescue StandardError
        #   r.halt 500, { message: 'Database error' }.to_json
        end
      end

      r.on 'todos/:id' do |id|
        puts(id)
        TodoService.new.update(id, r.params)
        status 204
      end

      

      r.get 'api' do
        puts('Todo.all', Todo.all)
        response['Content-Type'] = 'application/json'

        # JSON.generate({ success: true, message: 'Welcome to ruby roda vue world' })
        output = { data: Todo.all }
          response.status = 200
          JSON.pretty_generate(output)
      end

      # app part

      r.root do
        File.read(File.join('dist', 'index.html'))
      end

      r.get String do |_parsed_request|
        File.read(File.join('dist', 'index.html'))
      end
    end
  end
end
