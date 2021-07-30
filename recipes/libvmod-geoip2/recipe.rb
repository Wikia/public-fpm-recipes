class LibvmodGeoIp2 < FPM::Cookery::Recipe
  # Varnish version this module is targeting
  target_varnish_version = '6.4'
  # Upstream commit to build
  upstream_commit_hash = '7a25db5f3e9b8c428d754b4d59c38fbe2bc2f80e'

  homepage 'https://github.com/fgsch/libvmod-geoip2'
  source 'https://github.com/fgsch/libvmod-geoip2',
         :with => 'git',
         :sha => upstream_commit_hash

  name 'libvmod-geoip2'
  version "#{target_varnish_version}" # we use supported varnish version for our package versioning

  arch 'amd64'

  maintainer 'OPS <ops-l@wikia-inc.com>'
  description 'libvmod-geoip2 - A Varnish VMOD to query MaxMind GeoIP2 DB files'
  license 'BSD'
  vendor 'OPS'

  build_depends 'varnish-dev', 'libmaxminddb-dev'

  def build
    autogen
    configure
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
