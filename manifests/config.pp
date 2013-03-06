class beanstalk::config {
  require boxen::config

  $configdir   = "${boxen::config::configdir}/beanstalk"
  $datadir     = "${boxen::config::datadir}/beanstalk"
  $logdir      = "${boxen::config::logdir}/beanstalk"
  $binlogdir   = "${datadir}/binlogs"
  $executable  = "${boxen::config::homebrewdir}/bin/beanstalkd"

  $beanstalk_listen_address = "0.0.0.0"
  $beanstalk_listen_port    = "21300"

}
