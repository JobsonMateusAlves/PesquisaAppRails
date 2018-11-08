Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # pessoas_controller
  post "pessoas/cadastrar", to: "pessoas#create"
  get "pessoas", to: "pessoas#show"
  get "pessoa", to: "pessoas#show_one"
  delete "pessoas/:numero_registro/apagar", to: "pessoas#destroy"
  put "pessoas/:numero_registro", to: "pessoas#update"

  # cidades_controller
  get "cidades", to: "cidades#show"
  # fontes_controller
  get "fontes", to: "fontes#show"
  
end
