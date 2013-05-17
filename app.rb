# myapp.rb
require 'rubygems' if RUBY_VERSION < '1.9'
require 'sinatra'
require 'sinatra/config_file'
require "sqlite3"
require 'secret'
require 'user'

config_file = 'config.yml'

# connect to db
db = SQLite3::Database.new settings.db_file



#######################################################
# Login Routes
get '/login/:username/:password' do
end

get '/logout' do
end


#######################################################
# User Routes

get '/user/:param/:value' do
	#retrieves a user from the database

end

put '/user/:id' do
	# create a new user
end

post '/user' do
	# update existing user
end

delete '/user/:id' do
	# delete an existing user
end


#######################################################
# Secret Routes
get '/secret/:param/:value' do
	#retrieves a secret from the database

end

put '/secret/:id' do
	# create a new secret
end

post '/secret' do
	# update existing secret
end

delete '/secret/:id' do
	# delete an existing secret
end
