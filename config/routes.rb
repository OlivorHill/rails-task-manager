Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # Read all (GET)
  get "tasks", to: "tasks#index"

  # Create (POST)
  get "tasks/new", to: "tasks#new"
  post "tasks", to: "tasks#create"

  # Read One (GET)
  get "tasks/:id", to: "tasks#show", as: :task

  # Update / Edit (PATCH)
  get "tasks/:id/edit", to: "tasks#edit"
  patch "tasks/:id", to: "tasks#update"

  # Delete / Destroy (DELETE)
  delete "tasks/:id", to: "tasks#destroy"

  # If you look above at the first letter of each of the comments
  # It spells out... you guessed it! CRUD!
  # These are: Create, Update, Patch, Delete!
end
