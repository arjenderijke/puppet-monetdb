require 'spec_helper'

describe 'monetdb' do

  context 'on debian 8.0' do
    let(:facts) do
      {
        :osfamily               => 'Debian',
        :operatingsystem        => 'Debian',
        :operatingsystemrelease => '8.0'
      }
    end

    it 'should fail if the osfamily is not redhat' do
      expect {
        should compile.with_all_deps.to raise_error(RSpec::Expectations::ExpectationNotMetError)
      }
    end
  end
end
