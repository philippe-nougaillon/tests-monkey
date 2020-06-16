Rails.application.routes.draw do

  resources :scripts do 
    get :run
  end

end
