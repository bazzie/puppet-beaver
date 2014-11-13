require 'spec_helper'
describe 'beaver' do

  context 'with defaults for all parameters' do
    it { should contain_class('beaver') }
  end
end
