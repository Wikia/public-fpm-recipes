class Nsq < FPM::Cookery::Recipe
	homepage 'http://nsq.io/'
	source 'https://github.com/nsqio/nsq/releases/download/v1.2.0/nsq-1.2.0.linux-amd64.go1.12.9.tar.gz'
	md5 'bccedc491bf545877347745fdc345d9f'

	name 'nsq'
	version '1.2.0-wikia1'

	arch 'amd64'
	maintainer 'OPS <ops-l@wikia-inc.com>'
	description 'NSQ - A realtime distributed messaging platform'
	license 'GPL'
	vendor 'OPS'

	def build
	end

	def install
		bin.install 'bin/nsqadmin'
		bin.install 'bin/nsqd'
		bin.install 'bin/nsqlookupd'
		bin.install 'bin/nsq_stat'
		bin.install 'bin/nsq_tail'
		bin.install 'bin/nsq_to_file'
		bin.install 'bin/nsq_to_http'
		bin.install 'bin/nsq_to_nsq'
		bin.install 'bin/to_nsq'
	end
end
