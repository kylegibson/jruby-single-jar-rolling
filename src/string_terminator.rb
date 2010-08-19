class StringTerminator < Terminator
	def initialize(str)
		super str
	end
	def found_in?(buffer)
		buffer.include? @terminator
	end
	def split_at(buffer)
		index = buffer.index @terminator
		return buffer[0..index+@terminator.length-1], buffer[index+@terminator.length..-1]
	end
end
