require 'sinatra'
require 'haml'
require 'sass'
require 'holiday_jp'

set :haml, {:attr_wrapper => '"', :ugly => false}
set :sass, {:style => :expanded}

get '/' do
  today = Date.today
  @holiday = HolidayJp.between(today, today >> 2).first
  haml :index
end

get '/*.css' do |path|
  content_type 'text/css'
  sass path.to_sym, :sass => {:load_paths => [options.views]}
end
