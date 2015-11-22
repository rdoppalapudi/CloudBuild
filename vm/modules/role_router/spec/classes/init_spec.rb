require 'spec_helper'
describe 'role_router' do

  context 'with defaults for all parameters' do
    it { should contain_class('role_router') }
  end
end
