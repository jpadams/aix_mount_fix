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

    file { ['/etc/puppetlabs/facter', '/etc/puppetlabs/facter/facts.d']:
      ensure => directory,
    }

    file { '/etc/puppetlabs/facter/facts.d/aix_mount_fix_completed.txt':
      ensure  => file,
      content => 'aix_mount_fix_completed=true',
      require => File [ '/opt/puppet/lib/ruby/site_ruby/1.9.1/puppet/provider/mount/parsed.rb' ],
      require => File [ '/opt/puppet/lib/ruby/site_ruby/1.9.1/puppet/type/mount.rb' ], 
    } 
  }

}
