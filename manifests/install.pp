# == Class: clamsmtp::install
#
# Ensure the required packages are installed
#
# === Parameters
#
# === Variables
#
class clamsmtp::install {
  if $clamsmtp::package_name {
    package { $clamsmtp::package_name:
      ensure => 'present',
      notify => Class['clamsmtp::service']
    }
  }
}
