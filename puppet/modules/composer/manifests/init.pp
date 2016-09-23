# Install composer

class composer::install {

  package { "curl":
    ensure => installed,
  }

  exec { 'install composer':
    command => 'curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    require => Package['curl']
  }->

  exec { 'oauth_token composer':
    command => 'composer config --global github-oauth.github.com 95d3e96f827c6ff78da4b7649d04d094d2d58f03',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
  }

}
