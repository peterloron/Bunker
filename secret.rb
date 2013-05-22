require 'rubygems' if RUBY_VERSION < '1.9'
require 'jsonable'
require 'sequel'

class Secret < JSONable
	@path = ''
	@desc = ''
	@value = ''

	attr_accessor :path
	attr_accessor :desc
	attr_accessor :value

	def save
		$db[:secret].insert([:path, :desc, :value],[@path, @desc, @value])
	end

	def load(path)
		ds = $db[:secret].filter('path = ?', path).first!
		@path = ds[:path]
		@desc = ds[:desc]
		@value = ds[:value]
	end

end
