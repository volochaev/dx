require_relative 'controllers/welcome_controller'

module DX
  class Routes
    def initialize
      @app = Rack::Builder.new do
        map('/') { run WelcomeController }
        # map('/mtg/objects') { run MTG::ObjectsController }
        # map('/mtg/publishers') { run MTG::PublishersController }
        # map('/mtgobjects') { run MtgObjectsController }
        # map('/consumers')  { run ConsumersController }
        # map('/cities')  { run CitiesController }
        # map('/countries')  { run CountriesController }
      end
    end

    def call(env)
      @app.call(env)
    end
  end
end
