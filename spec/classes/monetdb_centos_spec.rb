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

    it do
      should compile.and_raise_error(/Operating System not supported/)
    end

  end
end
