node 'wiki' {
  file {'/info.txt':
    ensure  => 'present',
    content => inline_template("Created by puppet at <%= Time.now %>\n")
  }
  package { 'ntp':
    ensure  =>  'installed',
  }
  service { 'ntpd':
    ensure  =>  'runnig',
    enabled =>  true,
  }
}

node "wikitest" {
  package { 'ntp':
    ensure  =>  'installed',
  }
  service {'ntp':
    ensure  =>  'running',
    enabled =>  true,
  }
}