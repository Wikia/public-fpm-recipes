class CRITools < FPM::Cookery::Recipe
	homepage 'http://kubernetes.io/'
	source 'https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.20.0/crictl-v1.20.0-linux-amd64.tar.gz'
	md5 '39cb57811228cd0e313c8ecbe58eaf70'

	name 'cri-tools'
	version '1.20.0-wikia1'

	arch 'amd64'
	maintainer 'OPS <ops-l@wikia-inc.com>'
	description 'CLI and validation tools for Kubelet Container Runtime Interface (CRI)'
	license 'GPL'
	vendor 'OPS'

	def build
	end

	def install
		bin.install 'crictl'
		chmod 0755, bin('crictl')
	end
end
