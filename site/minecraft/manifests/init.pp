class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/c5f6fb23c3876461d46ec380421e42b289789530/server.jar'
  $install_dir = '/opt/minecraft'
){
  file {$install_dir:
    ensure  => directory,
  }
  file {"${$install_dir}/server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file {"${$install_dir}/eula.txt":
    ensure  => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
     ensure => file,
     source => epp('minecraft/minecraft.service',{
      install_dir => $install_dir,
     }),
  }
  service {'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'], File['/opt/minecraft/eula.txt'], File['/etc/systemd/system/minecraft/service']],
  }
}
