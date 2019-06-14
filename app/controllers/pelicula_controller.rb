require "rubygems"
require "httparty"

class PeliculaController < ApplicationController
  include HTTParty
  def index
    self.params = params.permit!
    @urls =  params[:informacion]
    id = @urls["episodeID"].to_i
    response1 =  HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
               headers: {'content-type': 'application/json'},
               body:{"query": "query{film(filmID: #{id}){title,releaseDate,episodeID,openingCrawl,director,producers,
                       characterConnection{characters{name,id}},
                       planetConnection{planets{name,id}},
                       starshipConnection{starships{name,id}},
                       }}"}.to_json)
    @response = JSON.parse(response1.body)
	@urls = @response["data"]["film"]
	@title = @urls["title"]
	@episode = @urls["episodeID"]
	@description = @urls["openingCrawl"]
	@director = @urls["director"]
	@producer = @urls["producers"]
	@año = @urls["releaseDate"]
    @characters = @urls["characterConnection"]["characters"]
    @planets = @urls["planetConnection"]["planets"]
    @starships = @urls["starshipConnection"]["starships"]
  end
end


