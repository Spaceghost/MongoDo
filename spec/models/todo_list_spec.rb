require 'spec_helper'


describe TodoList do

  describe 'validations' do
    let!(:todo_list) { Fabricate :todo_list }
    it { should validate_presence_of :name }
  end

end

