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
$db = Sequel.sqlite(settings.db_file)


#######################################################
# Login Routes
get '/login/:username/:password' do
end

get '/logout' do
end


#######################################################
# User Routes

get '/user/:value' do
	#retrieves a user from the database
	content_type :json
	begin
		usr = User.new()
		usr.load(params['value'])
		status 200
		usr.to_json
	rescue => e
		puts e.message
		status 500
		body "{\"message\": \"#{e.message}\"}"
	end
end

put '/user' do
	# create a new user
	content_type :json

	puts "Inserting user..."
	begin
		data = JSON.parse(request.body.read)
		usr = User.new()
		usr.username = data['username']
		usr.fullname = data['fullname']
		usr.email = data['email']
		usr.groups = data['groups']
		usr.save

		body "{'message': 'Insert OK'}"
		status 200
	rescue => e
		puts e.message
		body "{\"message\": \"#{e.message}\"}"
		status 500
	ensure

	end
	puts "Done inserting."
end

post '/user' do
	# update existing user
	content_type :json

	puts "Updating user..."
	begin
		data = JSON.parse(request.body.read)
		usr = User.new()
		usr.load(data['username'])

		usr.username = data['username']
		usr.fullname = data['fullname']
		usr.email = data['email']
		usr.groups = data['groups']
		usr.save

		body "{'message': 'Update OK'}"
		status 200
	rescue => e
		puts e.message
		body "{\"message\": \"#{e.message}\"}"
		status 500
	ensure

	end
	puts "Done inserting."
end

delete '/user' do
	# delete an existing user
	content_type :json

	puts "Deleting user..."
	begin
		data = JSON.parse(request.body.read)
		usr = User.new()
		usr.load(data['username'])
		usr.delete

		body "{'message': 'Delete OK'}"
		status 200
	rescue => e
		puts e.message
		body "{\"message\": \"#{e.message}\"}"
		status 500
	ensure

	end
	puts "Done deleting."
end


#######################################################
# Secret Routes
get '/secret/:value' do
	#retrieves a secret from the database
	content_type :json

	begin
		sec = Secret.new()
		sec.load(params['value'])
		status 200
		sec.to_json
	rescue => e
		puts e.message
		body "{\"message\": \"#{e.message}\"}"
		status 500
	end
end

put '/secret' do
	# create a new secret
	content_type :json
	begin
		data = JSON.parse(request.body.read)
		sec = Secret.new()
		sec.path = data['path']
		sec.desc = data['desc']
		sec.value = data['value']
		sec.save
		body "{\"message\": \"Secret created.\"}"
		status 200
	rescue => e
		puts e.message
		body "{\"message\": \"#{e.message}\"}"
		status 500
	end
end

post '/secret' do
	# update existing secret
	content_type :json
	begin
		data = JSON.parse(request.body.read)
		sec = Secret.new()
		sec.load(data['path'])
		sec.path = data['path']
		sec.desc = data['desc']
		sec.value = data['value']
		sec.save
		body "{\"message\": \"Secret updated.\"}"
		status 200
	rescue => e
		puts e.message
		body "{\"message\": \"#{e.message}\"}"
		status 500
	end

end

delete '/secret' do
	# delete an existing secret
	content_type :json
	begin
		data = JSON.parse(request.body.read)
		sec = Secret.new()
		sec.load(params['value'])
		sec.delete
		body "{\"message\": \"Secret deleted.\"}"
		status 200
	rescue => e
		puts e.message
		body "{\"message\": \"#{e.message}\"}"
		status 500
	end

end