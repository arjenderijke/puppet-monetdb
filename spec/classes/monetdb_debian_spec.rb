require 'spec_helper'

describe 'monetdb' do

  context 'on centos 7.0' do
    let(:facts) do
      {
        :osfamily               => 'Debian',
        :operatingsystem        => 'Debian',
        :operatingsystemrelease => '8.0'
      }
    end

    it do
      expect {
        should compile
      }.to raise_error(Puppet::Error, /Operating System not supported/)
    end
  end
end
