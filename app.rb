require './environment'
require "pry"
module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      params["pirate"]["ships"].each do |data|
        Ship.new(data["name"], data["type"], data["booty"])
      end
      @pirate=Pirate.new(params["pirate"]["name"], params["pirate"]["name"], params["pirate"]["name"])
      @ships=Ship.all
      # binding.pry
      erb :'pirates/show'
    end
  end
end
