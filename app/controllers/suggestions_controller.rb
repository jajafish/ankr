class SuggestionsController < ApplicationController
	include SuggestionsHelper

	def index
		@user = current_user
		people_with_this_intention = @user.intentions.each


	end


end