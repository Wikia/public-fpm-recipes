class OpenvpnCollisionManager < FPM::Cookery::Recipe
  homepage 'https://github.com/Wikia/openvpn-collision-manager'
  source 'https://github.com/Wikia/openvpn-collision-manager',
         :with => 'git'

  name 'openvpn-collision-manager'
  description 'openvpn-collision-manager daemon'

  version  '0.21'
  revision '1'

  # post_install 'post-install'
  # pre_install 'pre-install'
  # pre_uninstall 'pre-uninstall'

  build_depends %w(golang-go git)

  def install
    bin.install workdir("tmp-build/bin/registry")
    # bin.install workdir('gopath/bin/consul')
    # etc('consul.d').mkdir
    # etc('init').install_p workdir('consul.conf')
    #etc('docker/registry').mkdir
    #var('/var/lib/registry').mkdir
  end

  def build
    ENV['GOPATH'] = workdir("tmp-build/gopath")
    distDir = ENV['GOPATH'] + "/src/github.com/docker/distribution"

    #safesystem('go get github.com/tools/godep')
    #safesystem("git clone https://github.com/docker/distribution.git #{distDir}")
    #safesystem("cd #{distDir}; git reset --hard v2.2.1")
    #safesystem("cd #{distDir}; GOPATH=`$GOPATH/bin/godep path`:$GOPATH make PREFIX=#{workdir("tmp-build")} binaries")
    safesystem "make all"
  end
end
