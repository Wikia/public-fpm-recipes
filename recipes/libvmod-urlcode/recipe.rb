class LibvmodUrlcode < FPM::Cookery::Recipe
  # Varnish version this module is targeting
  target_varnish_version = '6.6'
  # Upstream commit to build
  upstream_commit_hash = '049afc1263684dd24eef8de868d8f7e7c16bf53f'

  homepage 'https://github.com/Wikia/libvmod-urlcode'
  source 'https://github.com/Wikia/libvmod-urlcode',
    :with => 'git',
    :sha => upstream_commit_hash

  name 'libvmod-urlcode'
  version "#{target_varnish_version}" # we use supported varnish version for our package versioning

  arch 'amd64'

  maintainer 'OPS <ops-l@wikia-inc.com>'
  description 'libvmod-urlcode - urlencode/urldecode functions vmod'
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
