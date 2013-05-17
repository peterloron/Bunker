require 'rubygems' if RUBY_VERSION < '1.9'

class User
	@username = ''
	@fullname = ''
	@email = ''

	attr_accessor :username
	attr_accessor :fullname
	attr_accessor :email

	def save
	end

end
