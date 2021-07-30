class PrometheusVarnishExporter < FPM::Cookery::Recipe
  upstream_version = '1.6'

  homepage 'https://github.com/jonnenauha/prometheus_varnish_exporter'
  source "https://github.com/jonnenauha/prometheus_varnish_exporter/releases/download/#{upstream_version}/prometheus_varnish_exporter-#{upstream_version}.linux-amd64.tar.gz"
  sha256 '5225ed77199e32250f0cb542140a538f45a217e3e9cf017e679e6c772758e879'

  name 'prometheus-varnish-exporter'
  version "#{upstream_version}"

  arch 'amd64'

  maintainer 'OPS <ops-l@wikia-inc.com>'
  description 'prometheus-varnish-exporter - Varnish exporter for Prometheus'
  license 'MIT'
  vendor 'OPS'

  def install
    safesystem 'mv prometheus_varnish_exporter prometheus-varnish-exporter'
    bin.install 'prometheus-varnish-exporter'
  end

  def build
  end
end
