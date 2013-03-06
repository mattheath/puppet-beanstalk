class beanstalk::config {
  require boxen::config

  $configdir   = "${boxen::config::configdir}/beanstalk"
  $datadir     = "${boxen::config::datadir}/beanstalk"
  $logdir      = "${boxen::config::logdir}/beanstalk"
  $binlogdir   = "${datadir}/binlogs"
  $executable  = "${boxen::config::homebrewdir}/bin/beanstalkd"

  $address     = "0.0.0.0"
  $port        = "21300"

}
