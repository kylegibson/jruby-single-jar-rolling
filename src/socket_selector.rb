class SocketSelector
  def select sockets
    return [], [] if sockets.nil?
    r, w, e = [], [], []

    sockets.each do |s|
      r.push(s) if !s.closed? && s.readable?
      w.push(s) if !s.closed? && s.writable?
    end

    begin
      _r, _w, _e = IO.select(r, w, e, nil)
    rescue IOError => ioe
      puts "I/O Error: #{ioe}"
    end
  end

  def loop sockets, emitter
    while not sockets.empty?
      r, w, e = select sockets
      emitter r, :handle_read
      emitter w, :handle_write
    end
  end
end
