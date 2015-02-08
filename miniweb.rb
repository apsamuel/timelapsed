$:.unshift "./lib" unless $:.include?("./lib")
require "sinatra"
require "socket"

set :public_folder, File.dirname(__FILE__) + '/static'

get "/test" do
  "Hello!!!"
end

get "/index" do
  send_file File.join(settings.public_folder, 'index.html')
end

get "/config_cam" do
  s = TCPSocket.new "192.168.1.194", 9999
  s.puts("config_camera")
end


get "/demo_camera" do
  s = TCPSocket.new "192.168.1.194", 9999
  s.puts("demo_camera")
end


get "/take_picture" do
  s = TCPSocket.new "192.168.1.194", 9999
  s.puts("take_picture")
end

get "/shoot_video" do
  s = TCPSocket.new "192.168.1.194", 9999
  s.puts("shoot_video")
end

get "/init_time_lapse" do
  s = TCPSocket.new "192.168.1.194", 9999
  s.puts("shoot_video")
end

get "/center_dev" do
  s = TCPSocket.new "192.168.1.194", 9999
  s.puts("center_dev")
end

get "/rotate_dev_back" do
  s = TCPSocket.new "192.168.1.194", 9999
  s.puts("rotate_dev_back")
end

get "/rotate_dev_left" do
  s = TCPSocket.new "192.168.1.194", 9999
  s.puts("rotate_dev_left")
end

get "/rotate_dev_left_far" do
  s = TCPSocket.new "192.168.1.194", 9999
  s.puts("rotate_dev_left_far")
end







