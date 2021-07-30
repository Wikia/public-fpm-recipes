class ConsulTemplate < FPM::Cookery::Recipe
    upstream_version = '0.25.1'
    source "https://releases.hashicorp.com/consul-template/#{upstream_version}/consul-template_#{upstream_version}_linux_amd64.tgz"
    sha256 '80b8068a155ff99808a3f7feafb16b2db7c40c0e1d034153f98cc3d79972d10b'

    name 'consul-template'
    version "#{upstream_version}"

    def install
        bin.install ['consul-template']
    end

    def build
    end
end
