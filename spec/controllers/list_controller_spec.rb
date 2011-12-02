require 'spec_helper'

describe ListController do

  describe 'GET "index"' do
    before :each do
      get :index
    end

    it 'is successful' do
      response.should be_success
    end

    it 'assigns a list of Lists' do
      assigns[:lists].should_not be_nil
      assigns[:lists].should respond_to :each # To make it enumerable
    end
  end

  describe 'GET "show"' do
    let!(:list) { Fabricate :list }
    before :each do
      get :show, :id => list.id
    end

    it 'is successful' do
      response.should be_success
    end

    it 'assigns the correct List' do
      assigns[:list].should_not be_nil
      assigns[:list].should == list
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

    it 'assigns a new List instance' do
      assigns[:list].should_not be_nil
      assigns[:list].should_not be_persisted
    end
  end

  describe 'POST "create"' do
    let!(:list) { Fabricate.build :list }

    it 'creates the List with the correct attributes' do
      attributes = stringify_values(Fabricate.attributes_for(:list))
      List.should_receive(:new).with(attributes) { list }
      post :create, :list => attributes
    end

    context 'successful creation' do
      before :each do
        List.should_receive(:new) { list }
        list.should_receive(:save) { true }
        post :create
      end

      it 'redirects to the List listing' do
        response.should redirect_to :action => :index
      end

      it 'sets a flash notice' do
        flash[:notice].should_not be_nil
      end

    end

    context 'creation failure' do
      before :each do
        List.should_receive(:new) { list }
        list.should_receive(:save) { false }
        post :create
      end

      it 're-assigns the List instance' do
        assigns[:list].should_not be_nil
        assigns[:list].should_not be_persisted
      end

      it 're-renders the new action' do
        response.should render_template :new
      end
    end
  end

end

