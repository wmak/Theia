class ReadingsController < ApplicationController
	def index
		@readings = Reading.last(10)
	end

	def data
		@readings = Reading.last(params[:time].to_i)
		render json: @readings
	end

	private
		def readings_params
			params.require(:readings).permit(:fan, :temp)
		end
end
