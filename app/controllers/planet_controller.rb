class PlanetController < ApplicationController
  def index
    self.params = params.permit!
    idp = params["content"]
    response1 =  HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
               headers: {'content-type': 'application/json'},
               body:{"query": "query{planet(id: \"#{idp}\"){name,diameter,rotationPeriod, orbitalPeriod, gravity, population, climates
               ,terrains,surfaceWater,
               filmConnection{films{title,episodeID}},
               residentConnection{residents{name,id}},
                       }}"}.to_json)
    @response = JSON.parse(response1.body)
    @informacion = @response["data"]["planet"]
  end
end
