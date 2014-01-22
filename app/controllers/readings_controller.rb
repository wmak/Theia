class ReadingsController < ApplicationController
	def index
		@readings = Reading.all
	end

	private
		def readings_params
			params.require(:readings).permit(:fan, :temp)
		end
end
