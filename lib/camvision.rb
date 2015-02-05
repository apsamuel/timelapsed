require "popen4"

module CamTools
	def lockCamera(dev)
		t = File::SEPARATOR +  'tmp' + File::SEPARATOR + ::File.basename(dev) + '.lck'
		::File.new(t)
	end

	def checkLockedCamera(dev)
		t = File::SEPARATOR +  'tmp' + File::SEPARATOR + ::File.basename(dev) + '.lck'
		::File.exists?(t) ? true : false
	end

	def unlockCamera(dev)
		t = File::SEPARATOR +  'tmp' + File::SEPARATOR + ::File.basename(dev) + '.lck'
		::File.unlink(t)
	end


    def bundleArgs(arghash)
    	arghash.collect { |i| 
    		i.flatten.collect {|x| 	
    			x.kind_of?(Symbol) ? ("--" + x.to_s) : x
    		} 
    	}.flatten
    end

	def procRunner(command,args)
		args = bundleArgs(args) #returns arr
        cmd = command + ' ' + args.join(' ') #returns str
    	status = POpen4::popen4( cmd ) do |stdout, stderr, stdin|
    		stdout.each do |line| 
    			puts line 
    		end
    	end

    	if status.exitstatus == 0
    		puts "Command completed successfully [command: %s | args: %s ]" % [command,args]
    	else
    		puts status.inspect
    		raise CommandFailedError
    	end
	end

end

module CamVision
	class InitFailError < StandardError
	end
    
    class CommandFailedError < StandardError
    end

	class ImageEngine
		include CamTools
		attr_reader :device, :mode

		def initialize(dev)
			if ::File.exists?(dev)
				@device = dev
			else
				raise InitFailError
			end
		end

        def demoVideo(opts={})
        	%w(none negative solarise sketch denoise emboss oilpaint hatch gpen pastel watercolour film blur saturation colourswap washedout posterise colourpoint colourbalance cartoon).each do |effect|
        		procRunner('/usr/bin/raspivid', Hash[:imxfx => effect, :verbose => ''])
        	end
        end

        def demoCamera(opts={})
          	procRunner('/usr/bin/raspistill', Hash[:demo => '', :verbose => ''])
        end

		def takePicture(opts={})
			procRunner('/usr/bin/raspistill', Hash[:timelapse => '1000', :timeout => 25000, :output => "/tmp/single-#{rand(36**12).to_s(36)}-#{Time.now.strftime("at_%I:%M%p")}-%04d.jpg"])
		end

		def shootVideo()
			procRunner('/usr/bin/raspivid', Hash[:timelapse => '1000', :timeout => 25000, :output => "/tmp/single-#{rand(36**12).to_s(36)}-#{Time.now.strftime("at_%I:%M%p")}-%04d.jpg"])
		end

		def initTimeLapse(opts={})
			procRunner('/usr/bin/raspistill', Hash[:timelapse => '1000', :timeout => 25000, :output => "/tmp/seq-#{rand(36**12).to_s(36)}-#{Time.now.strftime("at_%I:%M%p")}-%04d.jpg"])
		end


	end
end

#cam = CamVision::ImageEngine.new('/dev/video0')
#cam.demoCamera()
#h = {:rain => "snow", :disable => "" }
#a = h.collect {|i| i.flatten.collect {|x| x.kind_of?(Symbol) ? ("--" + x.to_s) : x } }.flatten
#puts a

