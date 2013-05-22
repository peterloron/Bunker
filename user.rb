require 'rubygems' if RUBY_VERSION < '1.9'
require 'jsonable'
require 'sequel'

class User < JSONable
	@username = ''
	@fullname = ''
	@email = ''
	@groups = []

	attr_accessor :username
	attr_accessor :fullname
	attr_accessor :email
	attr_accessor :groups

	def save
		$db[:user].insert([:username, :fullname, :email, :groups], [@username, @fullname, @email, @groups])
	end

	def load(username)
		ds = $db[:user].filter('username = ?', username).first!
		@username = ds[:username]
		@fullname = ds[:fullname]
		@groups = ds[:groups].split(",")
		@email = ds[:email]
	end
end
