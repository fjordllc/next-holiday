require "rubygems"
require "bundler"
Bundler.setup
require_relative "app"
run Sinatra::Application
