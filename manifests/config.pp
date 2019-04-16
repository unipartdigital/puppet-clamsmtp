# == Class: clamsmtp::config
#
# Full description of class role here.
#
# === Parameters
#
# === Variables
#
# Added 'inherits ::clamsmtp' as the vars weren't being collected from the params file. M.Perlov
#
class clamsmtp::config ()
  inherits ::clamsmtp
  {

  file { $clamsmtp::conf:
    ensure  => file,
    owner   => $clamsmtp::conf_user,
    group   => $clamsmtp::conf_group,
    mode    => $clamsmtp::conf_mode,
    content => template($clamsmtp::conf_template),
    require => Class['clamsmtp::install'],
    notify  => Class['clamsmtp::service'],
  }

  file { $clamsmtp::default:
    ensure  => file,
    owner   => $clamsmtp::default_user,
    group   => $clamsmtp::default_group,
    mode    => $clamsmtp::default_mode,
    content => template($clamsmtp::default_template),
    require => Class['clamsmtp::install'],
    notify  => Class['clamsmtp::service'],
  }
}
