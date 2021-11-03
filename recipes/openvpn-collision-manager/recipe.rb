class OpenvpnCollisionManager < FPM::Cookery::Recipe
  upstream_commit_hash = '41403633aadbda4e50a58726e701f90b1e7cca7a'
  homepage 'https://github.com/Wikia/openvpn-collision-manager'
  sha256 upstream_commit_hash
  source 'https://github.com/Wikia/openvpn-collision-manager',
         :with => 'git',
         :sha => upstream_commit_hash

  name 'openvpn-collision-manager'
  description 'openvpn-collision-manager daemon'

  version  '0.21'
  revision '1'

  build_depends %w(golang-go git)

  def install
    prefix('local/sbin').install workdir("tmp-build/gopath/bin/openvpn-collision-manager")
    etc('systemd/system').install local_path + ('openvpn-collision-manager.service')
    etc('logrotate.d').install local_path + ('logrotate') => 'openvpn-collision-manager'
  end

  def build
    ENV['GOPATH'] = workdir("tmp-build/gopath")
    ENV['GOBIN'] = ENV['GOPATH'] + "/bin"

    safesystem "make all"
  end
end
