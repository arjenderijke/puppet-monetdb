require 'spec_helper'

describe 'monetdb' do

  it do
    should contain_service('monetdbd').with(
                                                  'ensure' => 'running',
                                                  'enable' => true
                                                  )
  end
end
