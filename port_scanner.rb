require 'socket'

target = ARGV[0]
targetIP = IPSocket.getaddress(target)
puts 'Starting scan on host ' + targetIP

#scan reserved ports
for i in 20..1025
  begin
    s = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
    sockaddr = Socket.sockaddr_in(i, targetIP)
    if (s.connect(sockaddr) == 0)
      puts "Port #{i}: OPEN"
    end
  rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
    next
  end
end
