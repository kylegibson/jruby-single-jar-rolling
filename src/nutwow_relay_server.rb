require 'socket'
class NutWOWRelayServer < Socket
  include Socket::Constants
  def initialize opts
    super AF_INET, SOCK_STREAM, 0
    @opts = opts
  end

  def start
    self.reuse_bind_address true
    addr = Socket.pack_sockaddr_in(@opts[:port], @opts[:host])
    self.bind addr
    self.listen 5
  end

end
