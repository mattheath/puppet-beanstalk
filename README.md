# Beanstalk Puppet Module for Boxen

[Beanstalk](http://kr.github.com/beanstalkd/) is a simple, fast work queue.

## Usage

```puppet
include beanstalk
```

This will launch beanstalkd as a service listening on port 21300.

## Required Puppet Modules

* `boxen`
* `homebrew`

## Environment

Once installed, you can access the following variables in your environment, projects, etc:

* BOXEN_BEANSTALKD_PORT: the port beanstalkd will listen on (default 21300)

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
