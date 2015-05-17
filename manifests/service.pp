# == Class: clamsmtp::service
#
# Ensure clamstmp service.
#
# === Parameters
#
# === Variables
#
class clamsmtp::service {
  service { $clamsmtp::service_name:
    ensure     => running,
    enable     => true,
    require    => Class['clamsmtp::config'],
  }
}
