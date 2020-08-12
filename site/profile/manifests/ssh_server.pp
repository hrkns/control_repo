class profile::ssh_server {
  package { 'openssh-server':
    ensure => present,
  }
  service { 'sshd'
    ensure  => 'running',
    enable  =< 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm'
    ensure  => present,
    user    => 'root',
    type    => 'ssh-rsa',
    key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCmi0qg6Vcx9UPDlfGC9oyFHRHOHVsp9r5tmfbqzwpnzhwk4F4hGjkXXqoDgN/PRLRWRT/olFXRveWNMwUvjcudHxSgj2BJY5lfHmzekcA3nVMmyvbkZGpZyJ/3KHsKUISDeXG6eeVy3oJb9FVXomfUcZsf7CNmBMxLMhPWtJsKgU5KG9JCBkn5tVmCbylrjFl4N5qvk3CAER2/3PnRJD/52D8CA75ITka89sxIbQT+BrV7hxV+ug2EZ+sRtTdrJR99qIKiM1IvINNKRq9Wrato1J+8grbGwcCbjrFjYSZT3Jdhf/nWFUIjeixsQp8H8npHJVu6yKqr9Qur7MHxgf7H',
  }
}
