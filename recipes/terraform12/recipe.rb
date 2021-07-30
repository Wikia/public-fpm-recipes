class Terraform < FPM::Cookery::Recipe
  upstream_version = '0.12.6'
	homepage 'https://www.terraform.io'
	source "https://releases.hashicorp.com/terraform/#{upstream_version}/terraform_#{upstream_version}_linux_amd64.zip"
	sha256 '6544eb55b3e916affeea0a46fe785329c36de1ba1bdb51ca5239d3567101876f'

	name 'terraform12'
	version "#{upstream_version}-wikia1"
	revision '1'

	arch 'amd64'
	maintainer 'OPS <ops-l@wikia-inc.com>'
	description 'Terraform enables you to safely and predictably create, change, and improve infrastructure. It is an open source tool that codifies APIs into declarative configuration files that can be shared amongst team members, treated as code, edited, reviewed, and versioned.'
	license 'MPL 2.0'
	vendor 'OPS'

	def build
    safesystem('mv terraform terraform12')
	end

	def install
		sbin.install 'terraform12'
		chmod 0755, sbin('terraform12')
	end
end
