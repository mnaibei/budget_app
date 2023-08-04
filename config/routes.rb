Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :groups, only: %i[index new create destroy] do
    resources :actions, only: [:index]
  end

  root to: 'groups#index'
end
