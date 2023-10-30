require 'roda'
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

    r.root do
      File.read(File.join('dist', 'index.html'))
    end
  end
end
