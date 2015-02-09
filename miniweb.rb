$:.unshift "./lib" unless $:.include?("./lib")
require "sinatra"
require "socket"

set :public_folder, File.dirname(__FILE__) + '/static'
set :bind, '0.0.0.0'

get "/test" do
  "Hello!!!"
end

get "/index" do
  send_file File.join(settings.public_folder, 'index.html')
end

get "/config_cam" do
  begin
    s = TCPSocket.new "192.168.1.194", 9999
    s.puts("config_camera")
    msg = s.gets
    s.close
    msg
  rescue Errno::ECONNREFUSED => e
    "Please make sure the timelapserver is running on port 9999..."
  end
end


get "/demo_camera" do
  begin
    s = TCPSocket.new "192.168.1.194", 9999
    s.puts("demo_camera")
    msg = s.gets
    s.close
    msg
  rescue Errno::ECONNREFUSED => e
    "Please make sure the timelapserver is running on port 9999..."
  end
end


get "/take_picture" do
  begin
    s = TCPSocket.new "192.168.1.194", 9999
    s.puts("take_picture")
    msg = s.gets
    s.close
    msg
  rescue Errno::ECONNREFUSED => e
    "Please make sure the timelapserver is running on port 9999..."
  end
end

get "/shoot_video" do
  begin
    s = TCPSocket.new "192.168.1.194", 9999
    s.puts("shoot_video")
    msg = s.gets
    s.close
    msg
  rescue Errno::ECONNREFUSED => e
    "Please make sure the timelapserver is running on port 9999..."
  end
end

get "/init_time_lapse" do
  begin
    s = TCPSocket.new "192.168.1.194", 9999
    s.puts("shoot_video")
    msg = s.gets
    s.close
    msg
  rescue Errno::ECONNREFUSED => e
    "Please make sure the timelapserver is running on port 9999..."
  end
end

get "/center_dev" do
  begin
    s = TCPSocket.new "192.168.1.194", 9999
    s.puts("center_dev")
    msg = s.gets
    s.close
    msg
  rescue Errno::ECONNREFUSED => e
    "Please make sure the timelapserver is running on port 9999..."
  end
end

get "/rotate_dev_back" do
  begin
    s = TCPSocket.new "192.168.1.194", 9999
    s.puts("rotate_dev_back")
    msg = s.gets
    s.close
    msg
  rescue Errno::ECONNREFUSED => e
    "Please make sure the timelapserver is running on port 9999..."
  end
end

get "/rotate_dev_left" do
  begin
    s = TCPSocket.new "192.168.1.194", 9999
    s.puts("rotate_dev_left")
    msg = s.gets
    s.close
    msg
  rescue Errno::ECONNREFUSED => e
    "Please make sure the timelapserver is running on port 9999..."
  end
end

get "/rotate_dev_left_far" do
  begin
    s = TCPSocket.new "192.168.1.194", 9999
    s.puts("rotate_dev_left_far")
    msg = s.gets
    s.close
    msg
  rescue Errno::ECONNREFUSED => e
    "Please make sure the timelapserver is running on port 9999..."
  end
end

