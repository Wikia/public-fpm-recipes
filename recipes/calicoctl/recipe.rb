class Calicoctl < FPM::Cookery::Recipe
	homepage 'https://github.com/projectcalico/calicoctl'
	source 'https://github.com/projectcalico/calicoctl/releases/download/v3.20.2/calicoctl'
	md5 'ce8f9cedbee0f8cd0d6173f7122e88fd'

	name 'calicoctl'
	version '3.20.2-wikia1'

	arch 'amd64'
	maintainer 'OPS <ops-l@wikia-inc.com>'
	description 'Calico CLI tool'
	license 'GPL'
	vendor 'OPS'

	def build
	end

	def install
		bin.install 'calicoctl'
		chmod 0755, bin('calicoctl')
	end
end
