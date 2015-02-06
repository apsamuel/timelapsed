$:.unshift "./lib" unless $:.include?("./lib")
require "eventmachine"


include TimeLapseServer


EventMachine::run do
  Signal.trap("INT")  { EventMachine.stop }
  Signal.trap("TERM") { EventMachine.stop }
  
  host = '0.0.0.0'
  port = 9999
  EventMachine::start_server host, port, TimeLapseServer
  puts "Starting TimeLapseServer on #{host}:#{port}..."
end