# Install Yii2 via Composer

class yii2::install {
  exec {"composer install yii":
    command => 'composer global require "fxp/composer-asset-plugin:^1.2.0"; composer create-project --prefer-dist yiisoft/yii2-app-advanced /var/www/yii',
    require => Exec['install composer'],
  }->

  file { '/var/www/yii/frontend/config/main.php':
    source => '/vagrant/files/var/www/yii/frontend/config/main.php',
  }

#  exec { 'migrate database':
#    command => 'php yii migrate',
#    path => '/var/www/yii',
#  }
}
