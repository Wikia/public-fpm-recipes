class LibvmodUrlcode < FPM::Cookery::Recipe
  # Varnish version this module is targeting
  target_varnish_version = '6.4'
  # Upstream commit to build
  upstream_commit_hash = 'fbc8318f4ad239452f4aad29b0360e653fd6f257'

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
