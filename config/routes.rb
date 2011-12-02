MongoDo::Application.routes.draw do

  tasteful_resources :lists

  root :to => 'Lists#index'

end

