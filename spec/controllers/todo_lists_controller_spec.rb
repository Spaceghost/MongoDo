require 'spec_helper'

describe TodoListsController do

  describe 'GET "index"' do
    before :each do
      get :index
    end

    it 'is successful' do
      response.should be_success
    end

    it 'assigns a list of TodoLists' do
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

    it 'assigns the correct TodoList' do
      assigns[:todo_list].should_not be_nil
      assigns[:todo_list].should == todo_list
    end
  end

  describe 'GET "new"' do
    before :each do
      get :new
    end

    it 'is successful' do
      response.should be_success
    end

    it 'renders the new template' do
      response.should render_template :new
    end

    it 'assigns a new TodoList instance' do
      assigns[:todo_list].should_not be_nil
      assigns[:todo_list].should_not be_persisted
    end
  end

  describe 'POST "create"' do
    let!(:todo_list) { Fabricate.build :todo_list }

    it 'creates the TodoList with the correct attributes' do
      attributes = stringify_values(Fabricate.attributes_for(:todo_list))
      TodoList.should_receive(:new).with(attributes) { todo_list }
      post :create, :todo_list => attributes
    end

    context 'successful creation' do
      before :each do
        TodoList.should_receive(:new) { todo_list }
        todo_list.should_receive(:save) { true }
        post :create
      end

      it 'redirects to the TodoList listing' do
        response.should redirect_to :action => :index
      end

      it 'sets a flash notice' do
        flash[:notice].should_not be_nil
      end

    end

    context 'creation failure' do
      before :each do
        TodoList.should_receive(:new) { todo_list }
        todo_list.should_receive(:save) { false }
        post :create
      end

      it 're-assigns the TodoList instance' do
        assigns[:todo_list].should_not be_nil
        assigns[:todo_list].should_not be_persisted
      end

      it 're-renders the new action' do
        response.should render_template :new
      end
    end
  end

end

