require 'sinatra'
require 'slim'
require 'json'

get '/' do
  slim :index
end

post '/sign_up' do
  load('controllers/UserController.rb')
  controller = UserController.new

  controller.save(params)
  slim :index
end
