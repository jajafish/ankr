module SuggestionsHelper

def no_suggestions
		@user = current_user
		@user.intentions.each do |int|
			intent_to_check = int
			if intent_to_check.users.empty?
				return true
			end
		end 
		return false
end


end