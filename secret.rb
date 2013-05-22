require 'rubygems' if RUBY_VERSION < '1.9'
require 'jsonable'

class Secret < JSONable
	@path = ''
	@description = ''
	@value = ''

	def save
	end

end
