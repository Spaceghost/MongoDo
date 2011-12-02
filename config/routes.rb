MongoDo::Application.routes.draw do

  root :to => 'List#index'
  resources :list


end

