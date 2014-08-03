module DX
  class ApplicationController < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end

    configure do
      set :main_root, File.expand_path('../../', settings.root)
      set :views, main_root + '/views'
      set :public_folder, main_root + '/public'
    end
  end
end
