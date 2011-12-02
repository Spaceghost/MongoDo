MongoDo::Application.routes.draw do

  tasteful_resources :todo_lists
  root :to => 'TodoLists#index'


end

