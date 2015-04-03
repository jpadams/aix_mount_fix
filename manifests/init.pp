class aix_mount_fix {

  if $::osfamily == 'AIX' {
    file { '/opt/puppet/lib/ruby/site_ruby/1.9.1/puppet/provider/mount/parsed.rb':
      ensure => file,
      owner  => 'root',
      group  => 'system',
      mode   => '644',
      source => 'puppet:///modules/aix_mount_fix/parsed.rb',
    }
  
    file { '/opt/puppet/lib/ruby/site_ruby/1.9.1/puppet/type/mount.rb':
      ensure => file,
      owner  => 'root',
      group  => 'system',
      mode   => '644',
      source => 'puppet:///modules/aix_mount_fix/mount.rb',
    }
  }

}
