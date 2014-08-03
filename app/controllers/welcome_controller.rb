require_relative 'application_controller'

module DX
  class WelcomeController < ApplicationController
    register Sinatra::AssetPack
    root = settings.main_root

    assets {
      serve '/js',     from: root + '/assets/javascripts'

      serve '/css',    from: root + '/assets/stylesheets'
      css :application, [
        'css/bootstrap.css',
        'css/bootstrap-responsive.css',
        'css/generic.css',
        'css/images.css',
        'css/tables.css',
        'css/lists.css',
        'css/forms.css',
        'css/buttons.css',
        'css/header.css'
      ]

      serve '/images', from: root + '/assets/images'

      js_compression  :jsmin
      css_compression :sass
    }

    get '/' do
      slim :index
    end
  end
end
