class CharacterController < ApplicationController
  def index
    self.params = params.permit!
    idp = params["content"]
    response1 =  HTTParty.post("https://swapi-graphql-integracion-t3.herokuapp.com/",
               headers: {'content-type': 'application/json'},
               body:{"query": "query{person(id: \"#{idp}\"){name,birthYear,eyeColor,gender,hairColor,height,mass,skinColor,homeworld{name, id},
                       filmConnection{films{title,episodeID}},
                       starshipConnection{starships{name,id}},
                       }}"}.to_json)
    @response = JSON.parse(response1.body)
    @informacion = @response["data"]["person"]
  end
end




