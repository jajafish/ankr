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

		if signed_in?

		new_intention = params.require(:intention).permit(:name)
		@intention = Intention.create(new_intention)

		@intention.users << User.find(current_user.id)

		else
			redirect_to '/'

		end


		redirect_to intention_path(@intention.id)



	end

	def show
		@intention = Intention.find(params[:id])
	end



end
