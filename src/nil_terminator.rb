class NilTerminator < Terminator
	def initialize(count)
		super 
	end
	def found_in?(buffer)
		true
	end
	def split_at(buffer)
		return "", buffer
	end
end
