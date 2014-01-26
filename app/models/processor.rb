class Processor < ActiveRecord::Base
	def self.cpu_usage
		for i in 0..3
			#read input from top
			cpu = `top -bn 2 -d 0.01 | grep '^%Cpu' | tail -n 1 | gawk '{print $2+$4+$6}'`

			@temperature = self.new(:cpu => cpu.to_f)
			@temperature.save
			sleep(20)
		end
	end
end
