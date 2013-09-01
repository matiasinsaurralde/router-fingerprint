module RouterFingerprint
	def load_data()
		$routers = {}
		File.read( 'data' ).split("\n").each do |ln|
			splits = ln.split(',')
			$routers.store( splits.first, splits.last )
		end
	end
end

include RouterFingerprint
load_data()
