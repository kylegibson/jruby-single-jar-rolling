class FixedCountTerminator < Terminator
	def initialize(count)
		super count
	end
	def found_in?(buffer)
		buffer.length >= @terminator
	end
	def split_at(buffer)
		return buffer[index+@terminator..-1], buffer[0..@terminator]
	end
end
