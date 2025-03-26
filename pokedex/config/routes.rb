Rails.application.routes.draw do
  devise_for :users

  root "pokemons#index"

  resources :pokemons, param: :name, only: [ :index, :show ]
  resources :teams, only: [ :destroy ] do
    resources :team_members, only: [ :create ]
  end

  get "teams/teams_page" # Teams Page

  post "teams/:team_id/add_pokemon", to: "teams#create_team_member", as: :add_pokemon_to_team

  get "up" => "rails/health#show", as: :rails_health_check
end
