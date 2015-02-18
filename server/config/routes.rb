Rails.application.routes.draw do

  mount HesburghAPI::Engine => "/hesburgh_api"
end
