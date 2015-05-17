# == Class: clamsmtp
#
# Install and manage clamsmtp
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'clamsmtp': }
#
class clamsmtp (
  $action           = $clamsmtp::params::action,
  $bounce           = $clamsmtp::params::bounce,
  $clamaddress      = $clamsmtp::params::clamaddress,
  $conf             = $clamsmtp::params::conf,
  $conf_template    = $clamsmtp::params::conf_template,
  $conf_user        = $clamsmtp::params::conf_user,
  $conf_group       = $clamsmtp::params::conf_group,
  $conf_mode        = $clamsmtp::params::conf_mode,
  $daemon_opts      = $clamsmtp::params::daemon_opts,
  $default          = $clamsmtp::params::default,
  $default_template = $clamsmtp::params::default_template,
  $default_user     = $clamsmtp::params::default_user,
  $default_group    = $clamsmtp::params::default_group,
  $default_mode     = $clamsmtp::params::default_mode,
  $header           = $clamsmtp::params::header,
  $keepalives       = $clamsmtp::params::keepalives,
  $listen           = $clamsmtp::params::listen,
  $maxconnections   = $clamsmtp::params::maxconnections,
  $outaddress       = $clamsmtp::params::outaddress,
  $package_name     = $clamsmtp::params::package_name,
  $pidfile          = $clamsmtp::params::pidfile,
  $quarantine       = $clamsmtp::params::quarantine,
  $service_name     = $clamsmtp::params::service_name,
  $tempdirectory    = $clamsmtp::params::tempdirectory,
  $timeout          = $clamsmtp::params::timeout,
  $transparentproxy = $clamsmtp::params::transparentproxy,
  $user             = $clamsmtp::params::user,
  $virusaction      = $clamsmtp::params::virusaction,
  $xclient          = $clamsmtp::params::xclient,

) inherits clamsmtp::params {

  class { 'clamsmtp::install': }
  class { 'clamsmtp::config': }
  class { 'clamsmtp::service': }
}
