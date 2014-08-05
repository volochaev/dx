module DX
  class FrontController < DX::App
    register Sinatra::AssetPack

    root = settings.root

    assets {
      serve '/js',     from: root + '/assets/javascripts'
      js :application, [
        '/js/jquery.js',
        '/js/angular.js',
        '/js/angular/angular-route.js',
        '/js/angular/angular-resource.js',
        '/js/angular/angular-cookies.js',
        '/js/angular/angular-sanitize.js',
        '/js/angular/angular-locale_ru-ru.js',
        '/js/angular/ngDialog.min.js',
        '/js/app.js',
        '/js/controllers/home_controller.js',
        '/js/services/all_products.js',
        '/js/services/authentication.js',
        '/js/directives/loader.js',
        '/js/directives/product_tile.js',
        '/js/directives/user_panel.js'
      ]

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
        'css/header.css',
        'css/footer.css',
        'css/boxes_panels_modals.css',
        'css/cart_checkout.css',
        'css/categories.css',
        'css/flexslider.css',
        'css/products.css',
        'css/ratings.css',
        'css/tabs.css',
        'css/ngDialog.css'
      ]

      serve '/images', from: root + '/assets/images'
      serve '/templates', from: root + '/assets/templates'

      js_compression  :jsmin
      css_compression :sass
    }

    get '/' do
      slim :layout
    end

    get '/auth' do
      slim :'auth/new', layout: false
    end
  end
end
