#$:.unshift "./lib" unless $:.include?("./lib")
require 'socket'
require "shoes"

s = TCPSocket.open("192.168.1.194", 9999)




Shoes.app do 
stack do
  button "button one" do
    puts "button pressed"
  end
  @button_create_cams = button "Create Camera Object!!"
  @button_take_picture = button "Take a pic!!"
  @button_shoot_video = button "Shoot some footage!!"
  @button_init_time_lapse = button "Start Time lapse!!"
  @button_demo_camera = button "Demo Camera filters!!"
  @button_center_dev = button "Center Device!!"
  @button_rotate_back = button "Turn Back!!"
  @button_rotate_left = button "Turn Left!!"
  @button_rorate_dev_far_left = button "Go faaar left!!"

  @button_create_cams.click { s.send("config_camera\n") }
  @button_take_picture.click { s.send("take_picture\n") }
  @button_shoot_video.click { s.send("shoot_video\n") }
  @button_init_time_lapse.click { s.send("init_time_lapse\n") }
  @button_demo_camera.click { s.send("demo_camera\n") }
  @button_center_dev.click { s.send("center_dev\n") }
  @button_rotate_back.click { s.send("rotate_dev_back\n") }
  @button_rotate_left.click { s.send("rotate_dev_left\n") }
  @button_rotate_dev_far_left.click { s.send("rotate_dev_left_far\n") }
end
	
end
