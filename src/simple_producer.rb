require File.expand_path(File.join(File.dirname(__FILE__), "producer.rb"))

class SimpleProducer < Producer
	def initialize(data, chunksize=2048)
		@data = data.to_s
		@chunksize = chunksize.to_i
	end

	def more
    range = 0..@chunksize - 1
		d = @data[range]
		@data[range] = ""
		d
	end
end
