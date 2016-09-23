exec { 'apt_update':
  command => 'apt-get update',
  path    => '/usr/bin'
}

# set global path variable for project
# http://www.puppetcookbook.com/posts/set-global-exec-path.html
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin", "/usr/local/sbin", "~/.composer/vendor/bin/" ] }

class { 'git::install': }
class { 'apache2::install': }
class { 'php5::install': }

class { '::mysql::server':
  root_password           => 'vagrant',
  remove_default_accounts => true,
  override_options        => $override_options
}

mysql::db { 'yiidb':
  user        => 'yiiuser',
  password    => 'yiiPa55word!',
  host        => 'localhost',
  grant       => ['ALL'],
}

class { 'phpmyadmin::install': }
class { 'composer::install': }
class { 'phpqa::install': }
class { 'yii2::install': }
