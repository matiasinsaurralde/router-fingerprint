require 'digest/md5'

module RouterFingerprint
	def load_data()
		$routers = {}
		File.read( 'data' ).split("\n").each do |ln|
			splits = ln.split(',')
			$routers.store( splits.first, splits.last )
		end
	end
	def match( host, port = 80, connect_timeout = 5 )
		raw_html = `curl -s --connect-timeout #{connect_timeout} "http://#{host}:#{port}/"`
		$routers.key( Digest::MD5.hexdigest( raw_html ) )
	end
end

include RouterFingerprint
load_data()
