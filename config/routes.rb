Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :api do
    scope module: :v1 do
      resources :temperatures, only: [:index]
      get 'min_temperature', to: 'temperatures#min_temperature'
    end
  end
end
