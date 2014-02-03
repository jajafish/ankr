class IntentionsController < ApplicationController


	before_filter :check_intention_owner, only: [:destroy, :update, :edit]


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
		redirect_to intention_path(@intention.id)
	end

	def show
		@intention = Intention.find(params[:id])
	end



end
