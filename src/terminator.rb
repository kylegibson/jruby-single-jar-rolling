class Terminator
	attr_accessor :terminator
	def initialize(t = nil)
		@terminator = t
	end
	def found_in?(buffer)
		raise "not implemented"
	end
end
