require "kemal"
require "./store.cr"

post "/rover/:name" do |env|
  name = env.params.url["name"]
  Store.create(name)
  
  { status: :success }.to_json
end

get "/rover/:name" do |env|
  name = env.params.url["name"]
  
  { 
    status: :success, 
    state: Store.pretty(name) 
  }.to_json
end

post "/rover/move/:name/:move" do |env|
  name = env.params.url["name"]
  move = env.params.url["move"]
  
  state = Store.move(name, move)
  
  { 
    status: :success, 
    state: state
   }.to_json
end

delete "/rover/:name" do |env|
  name = env.params.url["name"]
  Store.delete(name)
  { status: :success }.to_json
end

Kemal.run