$ntpservice = $::osfamily ? {
  "redhat" => "ntpd",
  "debian" => "ntp",
  default  => "ntp",
}


node 'wiki' {
  file {'/info.txt':
    ensure  => 'present',
    content => inline_template("Created by puppet at <%= Time.now %>\n")
  }
  package { $ntpservice:
    ensure  =>  'installed',
  }
  service { $ntpservice:
    ensure  =>  'running',
    enable =>  true,
  }
}

node "wikitest" {
  package { $ntpservice:
    ensure  =>  'installed',
  }
  service {$ntpservice:
    ensure  =>  'running',
    enable =>  true,
  }
}
