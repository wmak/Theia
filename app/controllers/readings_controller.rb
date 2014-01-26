class ReadingsController < ApplicationController
	def data
		@readings = Reading.last(params[:time].to_i)
		render json: @readings
	end
end
