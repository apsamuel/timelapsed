$:.unshift "./lib" unless $:.include?("./lib")
require "eventmachine"

#include Mod(s)
include CamTurret
include CamVision
include TimeLapseServer


EventMachine::run do
  host = '0.0.0.0'
  port = 9999
  EventMachine::start_server host, port, TimeLapseServer
  puts "Starting TimeLapseServer on #{host}:#{port}..."
end