class SocketEventEmitter
  def emit sockets, event
    sockets.each do |s| 
      begin
        s.send event
      rescue
        s.handle_rescue
      end
    end
  end
end
