$:.unshift File.expand_path(File.join(File.dirname(__FILE__)))
$:.unshift File.expand_path(File.join(File.dirname(__FILE__), '..'))
require 'rubygems'
require 'bundler'
Bundler.setup(:default, :test)
require 'test/unit'
require 'rack/test'
require 'shoulda'
require 'delorean'

module TestHelper
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

Test::Unit::TestCase.send(:include, TestHelper)
