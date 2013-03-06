require 'formula'

class Beanstalk < Formula
  homepage 'http://kr.github.com/beanstalkd/'
  url 'https://github.com/downloads/kr/beanstalkd/beanstalkd-1.8.tar.gz'
  sha1 'b8c274d7233e02c6793d8d119608ad7c878b0954'

  version '1.8-boxen1'

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end
end