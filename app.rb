# myapp.rb
require 'rubygems' if RUBY_VERSION < '1.9'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/config_file'
require 'sequel'
require 'json'
require 'secret'
require 'user'

config_file 'config.yml'

# connect to db
@db = Sequel.sqlite(settings.db_file)


#######################################################
# Login Routes
get '/login/:username/:password' do
end

get '/logout' do
end


#######################################################
# User Routes

get '/user/:filter/:value' do
	#retrieves a user from the database
	#user = get_user(params['filter'], params['value'])
	#ds = @db[:user].filter('username = ?', params['value'])
	ds = @db[:user]
	puts ds.first
end

put '/user' do
	# create a new user
	data = JSON.parse(request.body.read)
	db.execute "INSERT INTO user VALUES(NULL,'#{data['username']}', '#{data['fullname']}', '#{data['email']}', '#{data['groups']}')"
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


# def get_user(filter, value)
# 	ds = @db[:user].filter('username = ?', value)
# 	puts ds.first
# end