require 'spec_helper'

describe 'todo_list/new.html.erb' do

  before :each do
    assign :todo_list, TodoList.new
    render
  end

  it 'renders a TODO List form' do
    rendered.should have_css 'div#form' do
      with_tag 'form[action=?]', todo_list_path
    end
  end

end

