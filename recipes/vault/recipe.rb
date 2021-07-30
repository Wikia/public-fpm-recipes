class Vault < FPM::Cookery::Recipe
	upstream_version = '1.2.2'
	homepage 'https://www.vaultproject.io'
	source "https://releases.hashicorp.com/vault/#{upstream_version}/vault_#{upstream_version}_linux_amd64.zip"
	sha256 '7725b35d9ca8be3668abe63481f0731ca4730509419b4eb29fa0b0baa4798458'

	name 'vault'
	version "#{upstream_version}"
	revision '1'

	arch 'amd64'
	maintainer 'OPS <ops-l@wikia-inc.com>'
	description 'A tool for secrets management, encryption as a service, and privileged access management.'
	license 'MPL 2.0'
	vendor 'OPS'

	def build
	end

	def install
	    target_dir = "#{destdir}/usr/local/sbin"

	    safesystem "mkdir -p #{target_dir}"
 	    safesystem "cp vault #{target_dir}/vault"	
	    safesystem "chmod 0775 #{target_dir}/vault"
	end
end
