class Server
  def initialize client_factory
    @client_factory = client_factory
  end
  def handle_accept
    sock, addr = accept
    @client_factory.create(sock, addr)
  end
end
