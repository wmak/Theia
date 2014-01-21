class WidgetsController < ApplicationController
	def new
	end

	def create
		@widget = Widget.new(widgets_params)
		@widget.save
		redirect_to @widget
	end

	def show
		@widget = Widget.find(params[:id])
	end

	private
		def widgets_params
			params.require(:widgets).permit(:title, :code)
		end
end