#channel width table for convenience...
#55 = centerDev
#215 = 180 from front (left from center pos)
#125 = 90 from front (left from center pos)
#250 = 280 from front (left from center pos)



module CamTurret
	class CamControl

	end

	class MotionEngine
		attr_reader :device, :pin, :value
		def initialize(device, pin=0)
			begin
			  fdesc = IO.sysopen(device, 'a')
			  dev = IO.new(fdesc)
			  @pin = pin
			  @device = dev
			rescue => e 
			  puts "Please address the following error before moving on.."
			  print 20.times('-')
			  puts "Message: \n#{e.message}", "Backtrace: \n#{e.backtrace}"
			  puts 
			end
		end

		def centerDev
			str = @pin.to_s + "=55" 
			puts str
			@device.puts(str)
			@device.flush
		end

		def rotateDev(width)
			str = @pin.to_s + "=" + width.to_s
		    puts str
			@device.puts(str)
			@device.flush
		end

		def swingDevLeft(range=55..250,sleep=0.1)
			centerDev()
			range.to_a.each do |width|
				str = @pin.to_s + "=" + width.to_s
				puts str
				@device.puts(str)
				@device.flush
			end
		end

		def swingDevRight(range=55..250,sleep=0.1)
			centerDev()
			range.to_a.reverse.each do |width|
				str = @pin.to_s + "=" + width.to_s
				puts str
				@device.puts(str)
				@device.flush
			end
		end
	end
end



#t = CamTurret::MotionEngine.new('/dev/servoblaster', 0)
#t.centerDev()
#t.rotateDev(100)
#t.swingDevRight()




