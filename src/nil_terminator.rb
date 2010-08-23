require File.expand_path(File.join(File.dirname(__FILE__), "terminator.rb"))

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
