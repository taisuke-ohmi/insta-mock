Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users,
    controllers: { registrations: 'registrations' }
  resources :users, only: %i(show)
  resources :posts, only: %i(index new create show) do
    resources :photos, only: %i(create)
  end
end
