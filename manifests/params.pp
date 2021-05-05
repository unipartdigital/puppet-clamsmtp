# == Class: clamsmtp::params
#
# This defines default configuration values for clamsmtp.
# You don't want to use it directly.
#
# === Parameters
#
# === Variables
#
# === Examples
#
class clamsmtp::params {
  $action           = 'drop'
  $conf             = '/etc/clamsmtpd.conf'
  $conf_template    = "${module_name}/clamsmtp.conf.erb"
  $conf_user        = 'root'
  $conf_group       = 'root'
  $conf_mode        = '0644'
  $daemon_opts      = undef
  $keepalives       = undef
  $maxconnections   = undef
  $timeout          = undef
  $header           = undef
  $bounce           = undef
  $quarantine       = undef
  $transparentproxy = undef
  $user             = 'clamsmtp'
  $virusaction      = undef
  $xclient          = undef
  $default_user     = 'root'
  $default_group    = 'root'
  $default_mode     = '0644'

# Centos config without the OS selection:

#  $outaddress       = '10026'
#  $listen           = "${::ipaddress}:10025"
#  $clamaddress      = '/var/run/clamd.clamsmtp/socket'
#  $tempdirectory    = '/var/lib/clamd.clamsmtp'
#  $pidfile          = '/run/clamsmtpd/clamsmtpd.pid'
#  $default          = '/etc/sysconfig/clamsmtpd'
#  $default_template = "${module_name}/clamsmtpd.el6.erb"
#  $package_name     = 'clamsmtp'
#  $service_name     = 'clamsmtp-clamd'



# Changed 6 to 7 below to make this work and deleted default to drop 7
  case $::operatingsystem {
    /Centos|CentOS/: {
      case $::operatingsystemmajrelease {
        '7': {
          $outaddress       = '10026'
          $listen           = undef
          $clamaddress      = '/var/run/clamd.clamsmtp/socket'
          $tempdirectory    = '/var/lib/clamd.clamsmtp'
          $pidfile          = '/run/clamsmtpd/clamsmtpd.pid'
          $default          = '/etc/sysconfig/clamsmtpd'
          $default_template = "${module_name}/clamsmtpd.el6.erb"
          $package_name     = 'clamsmtp'
          $service_name     = 'clamsmtp-clamd'
        }
      }
    }
    # @FIXME: Not tested
    /RedHat|Scientific|OracleLinux|OEL/: {
      case $::operatingsystemmajrelease {
        default: {
          $outaddress       = 10026
          $listen           = undef
          $clamaddress      = '/var/run/clamd.clamsmtp/clamd.sock'
          $tempdirectory    = '/var/lib/clamd.clamsmtp'
          $pidfile          = '/var/run/clamd.clamsmtp'
          $default          = '/etc/sysconfig/clamsmtpd'
          $default_template = "${module_name}/clamsmtpd.el6.erb"
          $package_name     = 'clamsmtp'
          $service_name     = 'clamsmtp-clamd'
        }
      }
    }
    'Debian': {
      case $::lsbdistrelease {
        default: {
          $outaddress       = 10025
          $listen           = '127.0.0.1:10026'
          $clamaddress      = '/var/run/clamav/clamd.ctl'
          $tempdirectory    = '/var/spool/clamsmtp'
          $pidfile          = '/var/run/clamsmtp/clamsmtpd.pid'
          $default          = '/etc/default/clamsmtp'
          $default_template = "${module_name}/clamsmtp.erb"
          $package_name     = 'clamsmtp'
          $service_name     = 'clamsmtp'
        }
      }
    }
    'Ubuntu': {
      case $::lsbdistrelease {
        default: {
          $outaddress       = 10025
          $listen           = '127.0.0.1:10026'
          $clamaddress      = '/var/run/clamav/clamd.ctl'
          $tempdirectory    = '/var/spool/clamsmtp'
          $pidfile          = '/var/run/clamsmtp/clamsmtpd.pid'
          $default          = '/etc/default/clamsmtp'
          $default_template = "${module_name}/clamsmtp.erb"
          $package_name     = 'clamsmtp'
          $service_name     = 'clamsmtp'
        }
      }
    }
    default: {
      fail("${module_name} is not supported on ${::operatingsystem}.")
    }
  }
}
