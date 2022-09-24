Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    :registrations => "users/registrations"
  }

  root to: "tasks#index"
  post '/tasks/:id/done' => 'tasks#done',   as: 'done'
  get 'calendar', to: 'tasks#calendar'
  resources :tasks do
    get :assign, on: :member
    
  end
  
  resources :users, only:[:show]
  get 'categories/list' => 'categories#list'
  resources :categories 
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end  
  post '/tasks/:id/edit', to: 'tasks#update'
end
