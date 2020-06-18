Rails.application.routes.draw do

  resources :scripts do 
    get :play

    collection do
      post :action
    end
  end

  root 'scripts#index'

end
