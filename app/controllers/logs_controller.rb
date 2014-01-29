class LogsController < ApplicationController
	def data
		@readings = Log.last(params[:time].to_i)
		render json: @readings
	end
end
