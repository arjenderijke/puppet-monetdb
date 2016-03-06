require 'spec_helper'

describe 'monetdb' do

  context 'on centos 7.0' do
    let(:facts) do
      {
        :osfamily               => 'RedHat',
        :operatingsystem        => 'Centos',
        :operatingsystemrelease => '7.0'
      }
    end

  end
end
