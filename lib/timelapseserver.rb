require 'eventmachine'

#filler code...
#TODO: add argument handling
#TODO: add error handling
#TODO: standardize cli for ctrl of hardware

module TimeLapseServer < EM::Connection
	@@cam = nil
	@@turret = nil
	#include Mod(s)
  	include CamTurret
  	include CamVision


  	def receive_data(data)
  		case data
  			while /config_camera/
  				send_data("Configuring Camera!!")
  				@@turret = CamTurret::MotionEngine.new('/dev/servoblaster', 0)
                @@cam = CamVision::ImageEngine.new('/dev/video0')
                send_data("Configured camera and turret objects!! #{@@cam} #{@@turret}")
  			while /take_picture/
  				send_data("Taking Picture!!")
  				@@cam.takePicture
  				send_data("Picture Taken!!")
  			while /shoot_video/
  				send_data("Shooting Video!!")
  				@@cam.shootVideo
  				send_data("Video Complete!!")
  			while /init_time_lapse/
  				send_data("Running Time Lapse!!")
  				@@cam.initTimeLapse
  				send_data("Time Lapse Complete!!")
   			while /demo_camera/
  				send_data("Running Time Lapse!!")
  				@@cam.demoCamera
  				send_data("Time Lapse Complete!!")
  		end
  	end


end


module TimeLapseAssistant
end
