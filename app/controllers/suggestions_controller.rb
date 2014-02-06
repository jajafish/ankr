class SuggestionsController < ApplicationController


	def index
		@user = current_user
		people_with_this_intention = @user.intentions.each


	end

	def create

	
	end

end