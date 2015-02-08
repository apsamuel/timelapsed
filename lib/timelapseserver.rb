$:.unshift "../lib" unless $:.include?("../lib")
require 'eventmachine'
require 'camturret'  
require 'camvision'

#filler code...
#TODO: add argument handling
#TODO: add error handling
#TODO: standardize cli for ctrl of hardware


module TimeLapse

CENTER=55
BACK_FROM_FRONT=215
LEFT_FROM_FRONT=125
FAR_LEFT_FROM_FRONT=250

  class Server < EM::Connection 
    @@cam = nil
    @@turret = nil
    #include Mod(s)
    include CamTurret
    include CamVision

    def receive_data(data)
      case data.to_s
        when /config_camera/
          send_data("Configuring Camera!!\n")
          @@turret = CamTurret::MotionEngine.new('/dev/servoblaster', 0)
          @@cam = CamVision::ImageEngine.new('/dev/video0')
          send_data("Configured camera and turret objects!! #{@@cam} #{@@turret}\n")
        when /take_picture/
          send_data("Taking Picture!!\n")
          @@cam.takePicture
          send_data("Picture Taken!!\n")
        when /shoot_video/
          send_data("Shooting Video!!\n")
          @@cam.shootVideo
          send_data("Video Complete!!\n")
        when /init_time_lapse/
          send_data("Running Time Lapse!!\n")
          @@cam.initTimeLapse
          send_data("Time Lapse Complete!!\n")
        when /demo_camera/
          send_data("Running Demo!!\n")
          @@cam.demoVideo
        when /center_dev/
	  send_data("Centering Device!!\n")
          @@turret.centerDev
          send_data("Moved to center!!\n")
        when /rotate_dev_back/
          send_data("Rotating device!!\n")
	  @@turret.rotateDev(TimeLapse::BACK_FROM_FRONT)
          send_data("Done rotating!!\n")
        when /rotate_dev_left/
          send_data("Rotating device!!\n")
	  @@turret.rotateDev(TimeLapse::LEFT_FROM_BACK)
          send_data("Done rotating!!\n")
        when /rotate_dev_left_far/
          send_data("Rotating device!!\n")
          @@turret.rotateDev(TimeLapse::FAR_LEFT_FROM_FRONT)
          send_data("Done rotating!!\n")
      end
    end
  end
end

