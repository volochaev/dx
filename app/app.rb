require 'sinatra'
require 'sinatra/assetpack'
require 'sinatra/json'
require 'sinatra/reloader'
require 'slim'

require 'pry'

module DX
  require File.expand_path('../routes', __FILE__)

  extend SingleForwardable
  def_single_delegators Routes, :call, :new
end
