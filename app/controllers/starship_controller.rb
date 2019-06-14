class StarshipController < ApplicationController

  def index
    self.params = params.permit!
    idp = params["content"]
    response1 =  HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
               headers: {'content-type': 'application/json'},
               body:{"query": "query{starship(id: \"#{idp}\"){name,model,starshipClass,manufacturers,costInCredits
               ,length,crew,passengers,maxAtmospheringSpeed, hyperdriveRating,MGLT, cargoCapacity, consumables,
                       filmConnection{films{title,episodeID,id}},
                       pilotConnection{pilots{name,id}},
                       }}"}.to_json)
    @response = JSON.parse(response1.body)
    @informacion = @response["data"]["starship"]
  end

end







