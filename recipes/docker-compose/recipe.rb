class DockerCompose < FPM::Cookery::Recipe
  upstream_version = '1.27.4'
  source "https://github.com/docker/compose/releases/download/#{upstream_version}/docker-compose-Linux-x86_64"
  sha256 '04216d65ce0cd3c27223eab035abfeb20a8bef20259398e3b9d9aa8de633286d'

  name 'docker-compose'

  version "#{upstream_version}"
  revision '2'

  arch 'amd64'
  maintainer 'OPS <ops-l@wikia-inc.com>'
  description 'Define and run multi-container applications with Docker'
  homepage 'https://docs.docker.com/compose/'
  license 'Apache-2.0'
  vendor 'OPS'

  def install
    File.chmod(0755, 'docker-compose-Linux-x86_64')
    bin.install 'docker-compose-Linux-x86_64' => 'docker-compose'
  end

  def build
  end
end
