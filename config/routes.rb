MongoDo::Application.routes.draw do

  tasteful_resources :lists

  root :to => 'List#index'

end

