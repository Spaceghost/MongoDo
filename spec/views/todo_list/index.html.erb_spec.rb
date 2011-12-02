require 'spec_helper'

describe 'todo_list/index.html.erb' do

  before :each do
    assign :todo_lists, {}
  end

  describe 'TODO List' do
    let(:todo_lists) {[Fabricate(:todo_list), Fabricate(:todo_list), Fabricate(:todo_list)]}

    before :each do
      assign :todo_lists, todo_lists
      render
    end

    it 'has a section for TODO Lists' do
      rendered.should have_css 'div#lists'
    end

    it 'displays each TODO List' do
      pending
      rendered.should have_css 'div#lists ul li', :count => todo_lists.count
    end

  end
end

