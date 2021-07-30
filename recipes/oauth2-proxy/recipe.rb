class OAuth2Proxy < FPM::Cookery::Recipe
  upstream_version = '6.0.0'

  homepage 'https://oauth2-proxy.github.io/oauth2-proxy/'
  source "https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v#{upstream_version}/oauth2-proxy-v#{upstream_version}.linux-amd64.go1.14.2.tar.gz"
  # NOTE: upstream checksum files provide checksums for the binary inside the archive rather than the archive itself!
  sha256 '8a11d81989edcdc1f76b424b4ef2ec501001deb86523e72a266e4c45ec6d7a1c'

  name 'oauth2-proxy'
  version "#{upstream_version}"

  arch 'amd64'

  maintainer 'OPS <ops-l@wikia-inc.com>'
  description 'oauth2-proxy - A reverse proxy that provides authentication with Google, Github or other providers.'
  license 'MIT'
  vendor 'OPS'

  def install
    bin.install 'oauth2-proxy'
  end

  def build
  end
end
