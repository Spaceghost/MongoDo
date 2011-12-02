require 'spec_helper'

describe 'named routes for the todo_list resource' do

  it 'routes "todo_list_index" route to the "todo_list#index" controller action' do
    {:get => todo_list_index_path}.
      should route_to(:controller => 'todo_list', :action => 'index')
  end

  it 'routes "new_todo_list" route to the "todo_list#new" controller action' do
    {:get => new_todo_list_path}.
      should route_to(:controller => 'todo_list', :action => 'new')
  end

  describe 'named routes that require an object passed to them for the todo_list resource' do
    let(:todo_list) {Fabricate(:todo_list)}

    before :each do
      pending
      assign :todo_list, todo_list
    end

    it 'routes "edit_todo_list" route to the "todo_list#edit" controller action' do
      pending
      {:get => edit_todo_list_path(todo_list)}.
      should route_to(:controller => 'todo_list', :action => 'edit')
    end

  end

end

