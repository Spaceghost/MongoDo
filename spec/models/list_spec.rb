require 'spec_helper'


describe List do

  describe 'validations' do
    let!(:list) { Fabricate :list }
    it { should validate_presence_of :name }
  end

end

