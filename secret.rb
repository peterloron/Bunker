require 'rubygems' if RUBY_VERSION < '1.9'
require 'jsonable'
require 'sequel'

class Secret < JSONable
	@path = ''
	@desc = ''
	@value = ''
	@in_db = false

	attr_accessor :path
	attr_accessor :desc
	attr_accessor :value

	def save
		if @in_db
			$db[:secret].where('path = ?', @path).update(:path => @path, :desc => @desc, :value => @value)
		else
			$db[:secret].insert([:path, :desc, :value],[@path, @desc, @value])
			@in_db = true
		end
	end

	def load(path)
		ds = $db[:secret].filter('path = ?', path).first!
		@path = ds[:path]
		@desc = ds[:desc]
		@value = ds[:value]
		@in_db = true
	end

	def delete()
		$db[:secret].where('path = ?', @path).delete
	end


end
