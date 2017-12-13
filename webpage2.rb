require './logwork'
require 'sinatra/base'

class WebLogWork < Sinatra::Application
	  
	set :root, File.dirname(__FILE__)
	set :public_folder, "./public_html"
	set :views, "./templates"
	set :bind, '0.0.0.0' # setting this config will make sinatra to listen to any IP.
	# default port is 4567
		
	get '/' do 
	  'Hello World!'
	end
	
end