Rails.application.routes.draw do
  resources :time_trackers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'time_trackers#index'
end
