require "rubygems"
require "bundler"
Bundler.setup
require 'sprockets'
require "./app"
run Sinatra::Application
