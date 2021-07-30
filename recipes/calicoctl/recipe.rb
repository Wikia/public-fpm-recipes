class Calicoctl < FPM::Cookery::Recipe
	homepage 'https://github.com/projectcalico/calicoctl'
	source 'https://github.com/projectcalico/calicoctl/releases/download/v3.16.5/calicoctl'
	md5 '5663fbc1bdb68f4e8c0accccbfb808c8'

	name 'calicoctl'
	version '3.16.5-wikia1'

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
