require 'rubygems' if RUBY_VERSION < '1.9'
require 'jsonable'
require 'sequel'

class User < JSONable
	@username = ''
	@fullname = ''
	@email = ''
	@groups = []
	@in_db = false

	attr_accessor :username
	attr_accessor :fullname
	attr_accessor :email
	attr_accessor :groups

	def save
		if @in_db
			$db[:user].where('username = ?', @username).update(:username => @username, :fullname => @fullname, :email => @email, :groups => @groups)
		else
			$db[:user].insert([:username, :fullname, :email, :groups], [@username, @fullname, @email, @groups])
			@in_db = true
		end
	end

	def load(username)
		ds = $db[:user].filter('username = ?', username).first!
		@username = ds[:username]
		@fullname = ds[:fullname]
		@groups = ds[:groups].split(",")
		@email = ds[:email]
		@in_db = true
	end

	def delete()
		$db[:user].where('username = ?', @username).delete
	end

end
