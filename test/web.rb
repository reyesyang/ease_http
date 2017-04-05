require 'sinatra'
require 'json'
require 'pry'

before do
  content_type :json
end

get '/' do
  params.to_json
end

post '/' do
  [201, params.to_json]
end
