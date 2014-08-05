require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/assetpack'
require 'sinatra/config_file'
require 'sinatra/json'
require 'sinatra/reloader'
require 'sinatra/respond_with'

require 'bcrypt'
require 'warden'
require 'slim'
require 'pry'

require './app/helpers/users_helper'

module DX
  class App < Sinatra::Base
    include UsersHelper

    register Sinatra::ActiveRecordExtension
    register Sinatra::ConfigFile
    register Sinatra::RespondWith
    # -*-
    configure :development do
      register Sinatra::Reloader
    end

    configure do
      set :app_root,      File.expand_path(settings.root, '/app')
      set :root,          File.expand_path('../', settings.root)
      set :views,         app_root + '/views'
      set :public_folder, root + '/public'
    end

    config_file root + '/config/config.yml'

    @@settings = DX::App.settings
  end

  require File.expand_path('../routes', __FILE__)

  extend SingleForwardable
  def_single_delegators Routes, :call, :new
end

require './app/services/auth_service'
require './app/models/user'

Warden::Strategies.add(:password) do
  def valid?
    if user = params['user']
      user['email'] || user['password']
    end
  end

  def authenticate!
    email, password = params['user'].slice('email', 'password').values
    user = User.find_by_email(email)

    if user && user.valid_password?(password)
      success! user
    else
      fail! 'Invalid email or password'
    end
  end
end
