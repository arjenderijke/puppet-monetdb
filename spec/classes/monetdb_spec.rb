require 'spec_helper'

describe 'monetdb' do

  it do
    should contain_service('monetdbd').with(
                                                  'ensure' => 'running',
                                                  'enable' => true
                                                  )
  end

  it do
    should contain_file('/etc/yum.repos.d/monetdb.repo').with(
                                                  'owner' => 'root',
                                                  'group' => 'root',
                                                  'mode' => '0644'
                                                  )
  end

end
