module IntentionsHelper

	def associate_words(intention)

	response = Unirest::post "https://twinword-topic-tagging.p.mashape.com/generate/", 
  		headers: { 
    		"X-Mashape-Authorization" => "5C6dpbqx8WPB9mcS1VKusvceo7B5wT3t"
  		},
  		parameters: { 
   			"text" => @intention.name
 		}

 	response.body["topic"].each do |k,v|

  		# check if this word exists in the word table,
  		# if it does, add it to the intention being created
  		# if not, create it and then add it

  		word = Word.where(:name => k)

		if word.blank?
			new_word = Word.create(name: k)
			@intention.words << new_word
		else
			@intention.words << word
  		end
	  	end

	end



	def find_intentions_from_an_intentions_words(intention)
		@words_intentions = []
		intention.words.each do |word|
			@words_intentions += word.intentions
		end
		return @words_intentions.uniq!
	end 

end
