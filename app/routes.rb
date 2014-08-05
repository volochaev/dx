require_relative 'controllers/front_controller'
require_relative 'controllers/api/sessions_controller'
require_relative 'controllers/api/products_controller'
require_relative 'controllers/api/users_controller'

module DX
  class Routes < DX::App
    def initialize
      @app = Rack::Builder.new do
        use Rack::Session::Cookie, key: 'DX.session',
                                   secret: @@settings.cookies_secret,
                                   path: '/',
                                   expire_after: 31557600


        use Warden::Manager do |config|
          config.default_scope = :user
          config.default_strategies :password
          config.failure_app = API::SessionsController
          config.serialize_into_session { |user| user.id }
          config.serialize_from_session { |id| User.find_by_id(id) }
        end

        map('/')             { run FrontController }
        map('/api/sessions') { run API::SessionsController }
        map('/api/products') { run API::ProductsController }
        map('/api/users')    { run API::UsersController }
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
