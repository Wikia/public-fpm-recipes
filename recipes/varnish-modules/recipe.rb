class VarnishModules < FPM::Cookery::Recipe
  # Varnish version these modules are compatible with
  target_varnish_version = '6.6'
  # Upstream version of varnish-modules to build
  upstream_modules_version = '0.18.0'

  homepage 'https://github.com/varnish/varnish-modules'
  source "https://github.com/varnish/varnish-modules/archive/refs/tags/#{upstream_modules_version}.tar.gz"
  # upstream doesn't provide checksums, so they must be calculated by us :(
  sha256 'b226d3272bc92fb46175c417aca5a8c5f820baa2868961cae7d832b561fc159e'

  name 'varnish-modules'
  version "#{target_varnish_version}" # we use supported varnish version for our package versioning

  arch 'amd64'

  maintainer 'OPS <ops-l@wikia-inc.com>'
  description 'varnish-modules - Collection of Varnish Cache modules (vmods) by Varnish Software'
  license 'BSD'
  vendor 'OPS'

  build_depends 'varnish-dev'

  def build
    safesystem "./bootstrap"
    configure
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
