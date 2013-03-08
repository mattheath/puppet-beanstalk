require 'spec_helper'

describe 'beanstalk' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'testuser',
    }
  end

  it do
    should include_class('homebrew')
    should contain_homebrew__formula('beanstalk')
    should contain_package('boxen/brews/beanstalk')

    should contain_service('dev.beanstalkd').with(:ensure => 'running')
  end

end
