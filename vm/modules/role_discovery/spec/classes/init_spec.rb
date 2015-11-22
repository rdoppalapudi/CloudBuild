require 'spec_helper'
describe 'role_discovery' do

  context 'with defaults for all parameters' do
    it { should contain_class('role_discovery') }
  end
end
