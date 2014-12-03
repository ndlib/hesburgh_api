Rails.application.routes.draw do

  mount HesburghApi::Engine => "/hesburgh_api"
end
