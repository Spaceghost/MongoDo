MongoDo::Application.routes.draw do
  get "todo_list/index"

  root :to => 'TodoList#index'
end
