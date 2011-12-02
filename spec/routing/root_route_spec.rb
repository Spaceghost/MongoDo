require 'spec_helper'

describe 'Root route should route to "TodoList#index" controller action' do
  it 'should route "/" to "TodoList#index"' do
    get("/").should route_to("TodoList#index")
  end
end

