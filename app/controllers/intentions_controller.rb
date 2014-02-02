class IntentionsController < ApplicationController


	def index
		@intentions = Intention.all
		@intention = Intention.new
	end

	def new
		@intention = Intention.new
	end

	def create
		new_intention = params.require(:intention).permit(:name)
		@intention = Intention.create(new_intention)
		redirect_to intention_path(intention.id)
	end



end
