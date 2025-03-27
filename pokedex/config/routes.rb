Rails.application.routes.draw do
  get "team_members/destroy"
  devise_for :users

  root "pokemons#index"

  resources :pokemons, param: :name, only: [ :index, :show ]
  resources :teams, only: [ :destroy ] do
    resources :team_members, only: [ :create, :destroy ]
  end

  get "teams/teams_page" # Teams Page

  # Adds pokemon to the team
  post "teams/:team_id/add_pokemon", to: "teams#add_team_member", as: :add_pokemon_to_team

  get "up" => "rails/health#show", as: :rails_health_check
end
