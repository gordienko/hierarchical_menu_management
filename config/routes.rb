Rails.application.routes.draw do
  resources :menuitems do
    member do
      patch :move
    end
  end

  root 'menuitems#index'
end
