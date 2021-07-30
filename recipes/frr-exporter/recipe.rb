class FrrExporter < FPM::Cookery::Recipe
  upstream_version = '0.2.13'

  homepage 'https://github.com/tynany/frr_exporter'
  source "https://github.com/tynany/frr_exporter/releases/download/v#{upstream_version}/frr_exporter-#{upstream_version}.linux-amd64.tar.gz"
  sha256 '97a3a8addbdf251eb625038633e1da6864cf1486ea241d93c32300c8f2be486f'

  name 'frr-exporter'
  version "#{upstream_version}-wikia1"

  arch 'amd64'

  maintainer 'OPS <ops-l@wikia-inc.com>'
  description 'frr-exporter - Prometheus exporter for Free Range Routing'
  license 'MIT'
  vendor 'OPS'

  def install
    bin.install 'frr_exporter'
  end

  def build
  end
end
