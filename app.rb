require 'sinatra'
require 'haml'
require 'sass'
require 'holiday_jp'

set :haml, {:attr_wrapper => '"', :ugly => false}
set :sass, {:style => :expanded}

get '/', :user_agent => /Mozilla\/5\.0.*iPhone.*?/ do
  today = Date.today
  @holiday = HolidayJp.between(today, today >> 12).first
  haml :iphone, :layout => false
end

get '/date/:date', :user_agent => /Mozilla\/5\.0.*iPhone.*?/ do
  today = Date.strptime(params[:date], "%Y-%m-%d")
  @holiday = HolidayJp.between(today, today >> 12).first
  haml :iphone, :layout => false
end

get '/' do
  today = Date.today
  @holiday = HolidayJp.between(today, today >> 6).first
  haml :index
end

get '/*.css' do |path|
  content_type 'text/css'
  sass path.to_sym, :sass => {:load_paths => [settings.views]}
end

helpers do
  def season
    case Time.now.month
    when 3..5
      'spring'
    when 6..8
      'summer'
    when 9..10
      'autumn'
    else
      'winter'
    end
  end
end
