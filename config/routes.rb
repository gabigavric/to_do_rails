Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'lists#index'
  resources :lists do
    resources :tasks, :except => [:show, :index]
    # You can also use :only to select only certain actions to include.
  end

  resources :tasks do
    resources :subtasks
  end
end
