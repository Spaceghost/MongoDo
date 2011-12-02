require 'spec_helper'

describe TodoListController do

  describe 'GET "index"' do

    before :each do
      get :index
    end

    it 'is successful' do
      response.should be_success
    end

    it 'assigns a list of TODO Lists' do
      assigns[:todo_lists].should_not be_nil
      assigns[:todo_lists].should respond_to :each # To make it enumerable
    end

  end

  describe 'GET "show"' do

    let!(:todo_list) { Fabricate :todo_list }

    before :each do
      get :show, :id => todo_list.id
    end

    it 'is successful' do
      response.should be_success
    end

    it 'assigns the correct TODO List' do
      assigns[:todo_list].should_not be_nil
      assigns[:todo_list].should == todo_list
    end

  end

end

