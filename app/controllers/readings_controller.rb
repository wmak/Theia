class ReadingsController < ApplicationController
	def create
		@readings = Readings.new(readings_params)
		@readings.save
	end

	private
		def readings_params
			params.require(:readings).permit(:fan, :temp)
		end
end
