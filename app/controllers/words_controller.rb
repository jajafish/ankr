class WordsController < ApplicationController

	def destroy
		id = params[:id]
		word = Word.find(id)
		word.destroy
		redirect_to '/'
	end

	def unlink
		word_id = params[:wordid]
		intention_id = params[:intentionid]
		target_intention = Intention.find(intention_id)
		target_intention.words.find(word_id).delete
		redirect_to admin_path
	end


end




	# target_intention.words.each do |word|
	# 		if word[:id] == word_id
	# 			target_intention.words.delete(word)
	# 		end
	# 	end