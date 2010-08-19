require 'socket'

class Socket
  def reuse_bind_address(v)
	  setsockopt(SOL_SOCKET, SO_REUSEADDR, v)
	end
end
