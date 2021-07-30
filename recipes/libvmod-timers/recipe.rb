class LibvmodTimers < FPM::Cookery::Recipe
  # Varnish version this module is targeting
  target_varnish_version = '6.4'
  # Upstream commit to build
  upstream_commit_hash = '5d5bcf1df87ebb5cc70e9b8a0c56bcd04d2b1415'

  homepage 'https://github.com/Wikia/libvmod-timers'
  source 'https://github.com/Wikia/libvmod-timers',
         :with => 'git',
         :sha => upstream_commit_hash

  name 'libvmod-timers'
  version "#{target_varnish_version}" # we use supported varnish version for our package versioning

  arch 'amd64'

  maintainer 'OPS <ops-l@wikia-inc.com>'
  description 'libvmod-timers - timers module for Varnish 6'
  license 'BSD'
  vendor 'OPS'

  build_depends 'varnish-dev'

  def build
    autogen
    configure
    make
  end

  def install
    make :check
    make :install, 'DESTDIR' => destdir
  end
end
