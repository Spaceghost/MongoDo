MongoDo::Application.routes.draw do

  root :to => 'TodoList#index'
  tasteful_resources :todo_lists


end

