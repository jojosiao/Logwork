require 'sinatra'
require './logwork'

set :root, File.dirname(__FILE__)
set :public_folder, "./public_html"
set :views, "./templates"
set :bind, '0.0.0.0' # setting this config will make sinatra to listen to any IP.
# default port is 4567

get '/' do 
  'Hello World!'
end

get '/logs' do 
  @lw = Logwork.new
  @lw.filename = "test.txt"
  @lw.logger = 'Jojo Siao'
  erb :index
end

get '/logs/view/:lognumber' do 
  # "Log number : #{params['lognumber']}"
  @lognumber = params['lognumber']
  @lw = Logwork.new
  @lw.filename = "test.txt"
  @logs = @lw.getlog
  erb :view 
end



get '/logs/new' do
  erb :new
end


post '/logs/create' do
  @log = params[:log]
  @lw = Logwork.new
  @lw.filename = "test.txt"
  @lw.lognumber = DateTime.now.strftime "%Y%m%d-%H%I%S"
  @lw.logger = 'Jojo Siao'
  @lw.log = @log.gsub /(\r\n|\n\r|\r|\n)/, '<br/>' 
  @lw.writelog

  redirect '/logs'
 
end



delete '/logs/delete/:lognumber' do

end

