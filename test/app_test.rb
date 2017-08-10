# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))
require 'app'

class AppTest < Test::Unit::TestCase
  context 'Access pages' do
    should 'show index' do
      get '/'
      assert_match 'Next Holiday', last_response.body
    end
  end
end
