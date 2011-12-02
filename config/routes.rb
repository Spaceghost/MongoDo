MongoDo::Application.routes.draw do

  tasteful_resources :todo_list

  root :to => 'TodoList#index'

end

