require 'roda'
require 'json'

class App < Roda
  plugin :render
  plugin :assets, js: ['main.bundle.js'], path: 'dist/'
  plugin :public, root: 'dist'
  route do |r|
    # r.run proc { |_parsed_request|
    #         # Set content type
    #         response = Roda::RodaResponse.new
    #         response['Content-Type'] = 'text/html'

    #         # Read HTML file
    #         html = File.read('views/index.html')

    #         # Write response
    #         response.write(html)
    #         response.finish
    #       }
    r.assets
    r.public

    # api part
    r.post 'todos' do
      todo = TodoService.new.create(r.params)
      status 201
      todo.to_json
    end

    r.on 'todos/:id' do |id|
      TodoService.new.update(id, r.params)
      status 204
    end

    r.on 'delete', 'todos/:id' do |id|
      TodoService.new.delete(id)
      status 204
    end

    r.get 'api' do
      response['Content-Type'] = 'application/json'

      JSON.generate({ success: true, message: 'Welcome to ruby roda vue world' })
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
