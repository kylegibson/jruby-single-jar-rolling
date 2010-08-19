class FixedCountTerminator < Terminator
	def initialize(count)
		super count
	end
	def found_in?(buffer)
		buffer.to_s.length >= @terminator
	end
	def split_at(buffer)
    buffer = buffer.to_s
		return buffer[0..@terminator-1].to_s, buffer[@terminator..-1].to_s
	end
end
