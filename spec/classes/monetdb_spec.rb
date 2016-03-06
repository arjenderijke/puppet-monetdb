require 'spec_helper'

describe 'monetdb' do

  context 'on fedora 22' do
    let(:facts) do
      {
        :osfamily               => 'RedHat',
        :operatingsystem        => 'Fedora',
        :operatingsystemrelease => '22'
      }
    end

    it do
      expect {
        should contain_service('monetdbd').with(
                 'ensure' => 'running',
                 'enable' => true
               )
      }
    end

    it do
      expect {
        should contain_file('/etc/yum.repos.d/monetdb.repo').with(
                 'owner' => 'root',
                 'group' => 'root',
                 'mode' => '0644'
               )
      }
    end
  end
end
