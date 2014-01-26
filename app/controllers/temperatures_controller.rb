class TemperaturesController < ApplicationController
	def data
		@temperatures = Temperature.last(params[:time].to_i)
		render json: @temperatures
	end
end
