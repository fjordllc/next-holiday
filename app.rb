# frozen_string_literal: true

require 'sinatra'
require 'haml'
require 'sass'
require 'holiday_jp'
require 'sprockets'
require 'oulu'
require 'autoprefixer-rails'
require 'rack/user_agent'

configure do
  Oulu.load_paths.each do |path|
    assets.append_path(path)
  end
  use Rack::UserAgent
end

assets = Sprockets::Environment.new do |env|
  # This ensures sprockets can find the CSS files
  env.append_path 'assets/stylesheets/'
  env.append_path 'assets/javascripts/'
end

AutoprefixerRails.install(assets)

get '/assets/stylesheets/*' do
  env['PATH_INFO'].sub!('/assets/stylesheets', '')
  assets.call(env)
end

get '/assets/javascripts/*' do
  env['PATH_INFO'].sub!('/assets/javascripts', '')
  assets.call(env)
end

get '/date/:date' do
  today = Date.strptime(params[:date], '%Y-%m-%d')
  @holiday = HolidayJp.between(today, today >> 12).first
  @next = HolidayJp.between(@holiday.date + 1, @holiday.date >> 12).first
  @prev = HolidayJp.between(@holiday.date << 12, @holiday.date - 1).last
  haml :index
end

get '/' do
  today = Date.today
  @holiday = HolidayJp.between(today, today >> 12).first
  @next = HolidayJp.between(@holiday.date + 1, @holiday.date >> 12).first
  @prev = HolidayJp.between(@holiday.date << 12, @holiday.date - 1).last
  haml :index
end
