class linux {
  $ntpservice = $::osfamily ? {
    "redhat" => "ntpd",
    "debian" => "ntp",
    default  => "ntp",
  }
  package { "ntp":
    ensure  =>  'installed',
  }
  service { $ntpservice:
    ensure  =>  'running',
    enable =>  true,
  }
    file { '/info.txt':
    ensure  => 'present',
    content => inline_template("Created by puppet at <%= Time.now %>\n")
  }
}

node 'wiki' {
  class { 'linux': }
}

node "wikitest" {
  class { "linux": }
}
