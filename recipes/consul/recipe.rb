class Consul < FPM::Cookery::Recipe
    upstream_version = '1.8.5'
    source "https://releases.hashicorp.com/consul/#{upstream_version}/consul_#{upstream_version}_linux_amd64.zip"
    sha256 '94ab38e6221d3da393d0bbdf19cc524051253a75db078c31e249dad2c497ad46'

    name 'consul'

    version "#{upstream_version}"
    revision '1'

    arch 'amd64'
    maintainer 'OPS <ops-l@wikia-inc.com>'
    description 'Consul Agent/Server'
    homepage 'https://www.consul.io'
    license 'MPL-2.0'
    vendor 'OPS'

    post_install 'post-install'
    pre_install 'pre-install'
    pre_uninstall 'pre-uninstall'

    def install
        bin.install ['consul']
        etc('consul.d').mkdir
        var('lib/consul').mkdir
    end

    def build
    end
end
