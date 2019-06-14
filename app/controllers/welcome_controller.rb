require "rubygems"
require "httparty"
class WelcomeController < ApplicationController
  include HTTParty
  def index
	response1 =  HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
               headers: {'content-type': 'application/json'},
               body:{"query": "query{allFilms
						               	{edges
						               		{node
						               			{title,releaseDate,episodeID,director,producers}}}}"}.to_json)
	@response = JSON.parse(response1.body)

  end

end
