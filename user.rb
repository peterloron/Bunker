require 'rubygems' if RUBY_VERSION < '1.9'
require 'jsonable'

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
	end

end
