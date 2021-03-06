require 'rubygems' if RUBY_VERSION < '1.9'
require './jsonable'
require 'sequel'

class User < JSONable
	@username = ''
	@fullname = ''
	@email = ''
	@groups = []
	@pwhash = ''
	@in_db = false

	attr_accessor :username
	attr_accessor :fullname
	attr_accessor :email
	attr_accessor :groups
	attr_accessor :pwhash

	def save
		if @in_db
			$db[:user].where('username = ?', @username).update(:username => @username, :fullname => @fullname, :email => @email, :groups => @groups.join(","), :pwhash => @pwhash)
		else
			$db[:user].insert([:username, :pwhash, :fullname, :email, :groups], [@username, @pwhash, @fullname, @email, @groups.join(",")])
			@in_db = true
		end
	end

	def load(username)
		ds = $db[:user].filter('username = ?', username).first!
		@username = ds[:username]
		@fullname = ds[:fullname]
		@groups = ds[:groups].split(",")
		@email = ds[:email]
		@pwhash = ds[:pwhash]
		@in_db = true
	end

	def delete()
		$db[:user].where('username = ?', @username).delete
	end

end
