module IntentionsHelper

	def check_intention_owner
		intention = current_user.intentions.where(:id => params[:id]).first
    	if intention.nil?
    		flash[:error] = "That's not your intention."
			redirect_to intention_path(params[:id])
		end
	end

end
