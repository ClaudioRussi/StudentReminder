Rails.application.routes.draw do
  get 'welcome/index'
  root to: 'welcome#index'

  devise_for :users

  resources :subjects do
    resources :tasks, shallow: true
  end

end
