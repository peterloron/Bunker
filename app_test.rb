require 'rubygems' if RUBY_VERSION < '1.9'
require './bunker'
require 'test/unit'
require 'rack/test'
require 'json'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    #Sinatra::Application
    Bunker
  end



  def test_create_user
    authorize 'admin', 'admin'
    put '/user', '{"username": "frank","fullname": "Frank Thomas","email": "frank@standingwave.org","groups": ["1","2","4"],"password": "sp8nker"}'
    assert last_response.ok?
    assert_equal '{"message": "Insert OK"}', last_response.body
  end

  def test_retrieve_user
    authorize 'admin', 'admin'
    get '/user/frank'
    assert last_response.ok?
    data = JSON.parse(last_response.body)

    assert_equal "frank", data['username']
    assert_equal "Frank Thomas", data['fullname']
    assert_equal "frank@standingwave.org", data['email']
    assert_equal "7f1a31e63abdeb28e95d99242e59a06fd1689ac8", data['pwhash']
    assert_equal "1,2,4", data['groups'].join(',')
    assert_equal true, data['in_db']
  end

  def test_update_user
    authorize 'admin', 'admin'
    post '/user', '{"username": "frank","fullname": "Frank Thomas222","email": "frankxxx@standingwave.org","groups": ["9"],"password": "sp8nkerz"}'
    assert last_response.ok?
    assert_equal '{"message": "Update OK"}', last_response.body

    get '/user/frank'
    assert last_response.ok?
    data = JSON.parse(last_response.body)

    assert_equal "frank", data['username']
    assert_equal "Frank Thomas222", data['fullname']
    assert_equal "frankxxx@standingwave.org", data['email']
    assert_equal "d478354653cf9d23c1fcc3e859873c81f5f23ac2", data['pwhash']
    assert_equal "9", data['groups'].join(',')
    assert_equal true, data['in_db']
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