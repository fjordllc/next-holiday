require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))
require 'app'

class AppTest < Test::Unit::TestCase
  context "Access pages" do
    should "show index" do
      get '/'
      puts last_response.body.class
      assert_match '体育の日', last_response.body
    end
  end
end
