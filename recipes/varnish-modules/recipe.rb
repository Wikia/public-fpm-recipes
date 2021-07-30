class VarnishModules < FPM::Cookery::Recipe
  # Varnish version these modules are compatible with
  target_varnish_version = '6.4'
  # Upstream version of varnish-modules to build
  upstream_modules_version = '0.16.0'

  homepage 'https://github.com/varnish/varnish-modules'
  source "https://github.com/varnish/varnish-modules/releases/download/#{upstream_modules_version}/varnish-modules-#{upstream_modules_version}.tar.gz"
  # upstream doesn't provide checksums, so they must be calculated by us :(
  sha256 'bab1cbcad6ab77a5cf75af51b15f666ff15cf77a50b04031f399dca8e95d05de'

  name 'varnish-modules'
  version "#{target_varnish_version}" # we use supported varnish version for our package versioning

  arch 'amd64'

  maintainer 'OPS <ops-l@wikia-inc.com>'
  description 'varnish-modules - Collection of Varnish Cache modules (vmods) by Varnish Software'
  license 'BSD'
  vendor 'OPS'

  build_depends 'varnish-dev'

  def build
    configure
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
