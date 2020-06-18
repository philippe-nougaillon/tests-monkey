Rails.application.routes.draw do

  resources :scripts do 
    get :play
  end

  root 'scripts#index'

end
