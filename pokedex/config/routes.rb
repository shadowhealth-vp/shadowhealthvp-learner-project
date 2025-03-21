Rails.application.routes.draw do
  devise_for :users

  root "pokemons#index"

  resources :pokemons, only: [ :index, :show ]
  resources :teams, only: [ :destroy ] do
    resources :team_members, only: [ :create ]
  end

  get "pokemons/index"
  get "pokemons/show"
  get "teams/teams_page"

  post "teams/:team_id/add_pokemon", to: "teams#create_team_member", as: :add_pokemon_to_team


  get "up" => "rails/health#show", as: :rails_health_check
end
