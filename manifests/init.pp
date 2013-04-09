# Public: Install Beanstalkd and run as a persistent service
#
# Examples
#
#   include beanstalk
#
class beanstalk {
  include beanstalk::config
  include homebrew

  file { [
    $beanstalk::config::configdir,
    $beanstalk::config::datadir,
    $beanstalk::config::logdir,
  ]:
    ensure => directory,
  }

  file { $beanstalk::config::binlogdir:
    ensure  => directory,
    require => File[$beanstalk::config::datadir],
  }

  homebrew::formula { 'beanstalk':
    source => 'puppet:///modules/beanstalk/brews/beanstalk.rb',
    before => Package['boxen/brews/beanstalk'] ;
  }

  package { 'boxen/brews/beanstalk':
    ensure => '1.8-boxen1',
  }

  # Make ports and listening addresses available as environment vars

  file { "${boxen::config::envdir}/beanstalk.sh":
    content => template('beanstalk/env.sh.erb'),
    require => File[$boxen::config::envdir]
  }

  # Fire up our beanstalk service

  file { '/Library/LaunchDaemons/dev.beanstalkd.plist':
    content => template('beanstalk/dev.beanstalkd.plist.erb'),
    group   => 'wheel',
    owner   => 'root',
    require => [
      Package['boxen/brews/beanstalk'],
      File[$beanstalk::config::binlogdir],
    ],
    notify  => Service['dev.beanstalkd'],
  }

  service { 'dev.beanstalkd':
    ensure  => running,
  }

}