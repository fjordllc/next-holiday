# frozen_string_literal: true

require 'rubygems'
require 'bundler'
Bundler.setup
require 'sprockets'
require './app'
run Sinatra::Application
