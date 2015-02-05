# timelapsed
This code is the foundation for the piCamTurret project. 
piCamTurret is tested on Rasberry Pi B+ Hardware running 2013+ version of raspbian.
* Motion - piCamTurret motion logic is based on ServoBlaster user land service.
  * support will be added for ServoBlaster kernel module, PiBlaster & GPIO::PWM (C Library) for hardware PWM control..
* Vision - piCamTurret camera logic is dependent on the preinstalled raspi* binaries for dealing with the piCam.
  * support will be added for ffmpeg/avconv, vlc (maybe) & v4l-ctl 
  * support will be added for integration of OpenCV library for face recognition, motion tracking, etc
  * support will be added for imagemagick for image/video post processing.
* Storage - piCamTurret is not only a robust module for capturing video and imagery, it is also a champion in storing the product.
  * TODO
  


## Hardware Dependencies
* [Rasberry B+]('http://www.raspberrypi.org/products/model-b-plus/')
* [piCam]('http://www.raspberrypi.org/help/camera-module-setup/')

## Software Dependencies
* Ruby 1.9.x +
  * popen4, eventmachine
* ServoBlaster
  * Installation How to
  * [Source Code]('https://github.com/richardghirst/PiBits/tree/master/ServoBlaster')
  
## Setup the system
  * The good news is this will be moving to a chef-solo cookbook shortly.

### Get the latest Raspbian packages
  * sudo apt-get update
  * sudo apt-get upgrade

### Get the latest firmware
  * sudo rpi-update

### Install some packages needed to build it (optional, only if you need to build v4l-tools for some reason)
  * sudo apt-get install autoconf gettext libtool libjpeg62-dev

### Install v4l-tools from package repos
  * sudo apt-get install v4l-tools

### Enable the v4l video driver. (you may need to reboot to apply the above changes before this works)
  * sudo modprobe bcm2835-v4l2
  * echo bcm2835-v4l2 >> /etc/modules (for persistent loading after reboot)
  
### Retrieve and Build OpenCV and dependencies.
  * sudo apt-get -y install build-essential cmake cmake-qt-gui pkg-config libpng12-0 libpng12-dev libpng++-dev libpng3 libpnglite-dev zlib1g-dbg zlib1g zlib1g-dev pngtools libtiff4-dev libtiff4 libtiffxx0c2 libtiff-tools
  * sudo apt-get -y install libjpeg8 libjpeg8-dev libjpeg8-dbg libjpeg-progs ffmpeg libavcodec-dev libavcodec53 libavformat53 libavformat-dev libgstreamer0.10-0-dbg libgstreamer0.10-0 libgstreamer0.10-dev libxine1-ffmpeg libxine-dev libxine1-bin libunicap2 libunicap2-dev libdc1394-22-dev libdc1394-22 libdc1394-utils swig libv4l-0 libv4l-dev python-numpy libpython2.6 python-dev python2.6-dev libgtk2.0-dev pkg-config
  * wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.3.1/OpenCV-2.3.1a.tar.bz2
  * tar -xvjpf OpenCV-2.3.1a.tar.bz2
  * rm OpenCV-2.3.1a.tar.bz2
  * cd OpenCV-2.3.1/
  * mkdir build
  * cd build
  * cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_PYTHON_SUPPORT=ON -D BUILD_EXAMPLES=ON ..
  * make
  * sudo make install
  
### Retrieve the piTurretCam software (that is this)
  * git clone git@github.com:apsamuel/timelapsed.git /opt/timelapse
  * cd /opt/timelapse
  * bundle update
  * rake configure
  * rake build
  * /etc/init.d/timelapse (start|stop|restart|status)
  
### API Examples

#creating a camera object
  * cam = CamVision::ImageEngine.new('/dev/video0')
  * cam.demoCamera()

#creating a turret object
  * turret = CamTurret::MotionEngine.new('/dev/servoblaster', 0)
  * turret.centerDev()
  * turret.rotateDev(100)
  * turret.swingDevRight()


