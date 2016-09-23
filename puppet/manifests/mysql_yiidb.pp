class { 'mysql_yiidb':
  class { '::mysql::server':
    root_password           => 'vagrant',
    remove_default_accounts => true,
    override_options        => $override_options
  }

  mysql::db { 'yiidb'
    user        => 'yiiuser',
    password    => 'yiiPa55word!',
    host        => 'localhost',
  }

  mysql_user { 'yiiuser@localhost':
    ensure      => 'present',
  }

  mysql_grant { 'yiiuser@localhost':
    ensure      => 'present',
    options     => ['GRANT'],
    privileges  => ['ALL'],
    user        => 'yiiuser@localhost',
  }
}
