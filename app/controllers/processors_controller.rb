class ProcessorsController < ApplicationController
	def data
		@processors = Processor.last(params[:time].to_i)
		render json: @processors
	end
end