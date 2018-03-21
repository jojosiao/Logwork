require './logwork'
require 'sinatra/base'

class WebLogWork < Sinatra::Base
		
	set :root, File.dirname(__FILE__)
	set :public_folder, "./public_html" #To serve static files in public_html.
	set :views, "./templates"
	set :bind, '0.0.0.0' # setting this config will make sinatra to listen to any IP.
	# default port is 4567
	set :sessions, true	
	set :logging, true

	get '/login' do
		erb :login
	end

	# TODO: check if form username and password is met. grant access.
	# if FAILURE: show error message to login form.
	post '/login' do
		#if params['username']
	end
	
	get '/logout' do
	end


	get '/' do 
		redirect '/logs'
	end

	get '/logs' do 
	end

	get '/logs/view/:lognumber' do 
	end

	get '/logs/new' do
	end

	post '/logs/create' do
	end


	delete '/logs/delete/:lognumber' do

	end

end

