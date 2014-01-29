class Log < ActiveRecord::Base
	def self.read_top
		for i in 0..3
			@reading = self.new(:reading => `top -bn 2 -d 0.01`)
			@reading.save
			sleep(20)
		end
	end
end
