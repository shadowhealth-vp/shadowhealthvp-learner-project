Rails.application.routes.draw do
  # Health check?
  get "up" => "rails/health#show", as: :rails_health_check

  # Devise with custom registrations controller
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  # Root
  root "pokemons#index"

  # Pokémons
  resources :pokemons, param: :name, only: [ :index, :show ]

  # Teams & Team Members
  resources :teams, only: [ :destroy ] do
    resources :team_members, only: [ :create, :destroy ]
  end

  # Route for teams page
  get "teams/teams_page", to: "teams#teams_page"

  # Custom route for adding Pokémon to a team
  post "teams/:team_id/add_pokemon", to: "teams#add_team_member", as: :add_pokemon_to_team
end
