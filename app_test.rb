require 'rubygems'
require './app'
require 'test/unit'
require 'rack/test'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_default
    get '/user/frank'
    assert_equal '{"email":"frank@standingwave.org","groups":["1","2","4"],"fullname":"Frank Thomas","username":"frank"}', last_response.body
  end

  # def test_with_params
  #   get '/meet', :name => 'Frank'
  #   assert_equal 'Hello Frank!', last_response.body
  # end

  # def test_with_rack_env
  #   get '/', {}, 'HTTP_USER_AGENT' => 'Songbird'
  #   assert_equal "You're using Songbird!", last_response.body
  # end
end