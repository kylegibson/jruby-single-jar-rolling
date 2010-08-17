class SimpleProducer < Producer
	def initialize(data, chunksize=2048)
		@data = data
		@chunksize = chunksize
	end

	def more
    ""
		# d = @data[0..@chunksize]
		# @data[0..@chunksize - 1] = ""
		# d
	end
end
