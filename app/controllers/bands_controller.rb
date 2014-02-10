class BandsController < ApplicationController


	def new
		@band = Band.new
	end

	def index
		@bands = Band.all
	end




end
