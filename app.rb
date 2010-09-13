require 'sinatra'
require 'haml'
require 'sass'
require 'holiday_jp'

class App < Sinatra::Base
  configure do
    set :app_file, __FILE__
    set :haml, {:attr_wrapper => '"', :ugly => false}
    set :sass, {:style => :expanded}
  end

  get '/' do
    today = Date.today
    @holiday = HolidayJp.between(today, today >> 2).first
    haml :index
  end

  get '/*.css' do |path|
    content_type 'text/css'
    sass path.to_sym, :sass => {:load_paths => [options.views]}
  end
end
