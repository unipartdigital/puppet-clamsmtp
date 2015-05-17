# puppet-clamsmtp

A simple module to solely manage the ClamSMTP filter - an SMTP server for 
scanning viruses via clamd.

## Requirements

- Puppet >= 2.7

## Dependencies

- None

## Supported Platforms

- Debian (6,7 tested)
- Ubuntu (12.04, 14.04 tested)
- CentOS (6 tested)
- RedHat and variants (NOT tested)

## Usage

Using the default values

~~~puppet
class { 'clamsmtp': }
~~~


All variables are named the same in lowercase. Example;

~~~puppet
class { 'clamsmtp':
  action           => 'drop',
  header           => 'X-AV-Checked: ClamAV using ClamSMTP',
  keepalives       => 0,
  listen           => '127.0.0.1:10026',
  maxconnections   => 64,
  outaddress       => 10025,
  quarantine       => undef,
  timeout          => 180,
}
~~~

## All Parameters

A list of all parameters. Undef parameters result in clamsmtp using its default
values.

See
[clamsmtpd(5)](http://thewalter.net/stef/software/clamsmtp/clamsmtpd.conf.html)

| Name               | Values (defaults and examples)                          |
| ------------------ | ------------------------------------------------------- |
| action             | drop, bounce, pass                                      |
| bounce             | undef                                                   |
| clamaddress        | /var/run/clamav/clamd,/var/run/clamd.clamsmtp/clamd.sock|
| conf               | /etc/clamsmtpd.conf                                     |
| conf_template      | ${module_name}/clamsmtp.conf.erb                        |
| conf_user          | root                                                    |
| conf_group         | root                                                    |
| conf_mode          | 0644                                                    |
| daemon_opts        | undef                                                   |
| default            | /etc/default/clamsmtp, /etc/sysconfig/clamsmtpd         |
| default_template   | ${module_name}/clamsmtpd.erb                            |
| default_user       | root                                                    |
| default_group      | root                                                    |
| default_mode       | 0644                                                    |
| header             | undef                                                   |
| keepalives         | undef                                                   |
| listen             | 127.0.0.1:10026, undef                                  |
| maxconnections     | undef                                                   |
| outaddress         | 10025, 10026                                            |
| package_name       | clamsmtp                                                |
| pidfile            | /var/run/clamsmtp/clamsmtpd.pid,/var/run/clamd.clamsmtp |
| quarantine         | undef                                                   |
| service_name       | clamsmtp, clamsmtp-clamd                                |
| tempdirectory      | /var/spool/clamsmtp, /var/lib/clamd.clamsmtp            |
| timeout            | undef                                                   |
| transparentproxy   | undef                                                   |
| user               | clamsmtp                                                |
| virusaction        | undef                                                   |
| xclient            | undef                                                   |

## Limitations and Notes

- CentOS 7 is not supported (I couldn't find the relevant packages).
