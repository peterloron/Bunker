# myapp.rb
require 'rubygems' if RUBY_VERSION < '1.9'
require 'sinatra/base';

class Bunker < Sinatra::Base
  get '/' do
    'Hello World from MyApp in separate file!'
  end
end