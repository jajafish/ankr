class IntentionsController < ApplicationController


	# before_filter :check_intention_owner, only: [:destroy, :update, :edit]


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

			desired_intention = Intention.find_by_name(:name)

			if desired_intention.blank?
				@intention = Intention.create(new_intention)
				@intention.users << User.find(current_user.id)
				associate_words(@intention)	
		
			else
				desired_intention.users << User.find(current_user.id)
			end 
	  	
		end

		redirect_to '/'

	end



	# all_intentions = []
	  	# @intention.words.each	do |word|
	  	# 	all_intentions << word.intentions 
	  	# end


	def show
		@intention = Intention.find(params[:id])
		@intentions_intentions = associate_intentions(@intention)

	end


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


	def associate_intentions(intention)
		@words_intentions = []
		intention.words.each do |word|
			@words_intentions << word.intentions
		end
		return @words_intentions
	end





# [1] pry(#<IntentionsController>)> response
# => #<Unirest::HttpResponse:0x007fbe03aa70f8
#  @body=
#   {"keyword"=>{"bowling"=>1},
#    "topic"=>
#     {"game"=>11,
#      "golf"=>10,
#      "play"=>10,
#      "sport"=>8,
#      "water"=>8,
#      "club"=>8,
#      "ball"=>7,
#      "swimming"=>7,
#      "pool"=>5,
#      "diving"=>5},
#    "result_code"=>"200",
#    "result_msg"=>"Success"},
#  @code=200,
#  @headers=
#   {:content_type=>"text/html; charset=utf-8",
#    :date=>"Wed, 05 Feb 2014 00:05:51 GMT",
#    :server=>"Apache",
#    :x_mashape_proxy_response=>"false",
#    :x_mashape_version=>"3.1.11",
#    :x_powered_by=>"PHP/5.3.9",
#    :content_length=>"179",
#    :connection=>"keep-alive"},
#  @raw_body=
#   "{\"keyword\":{\"bowling\":1},\"topic\":{\"game\":11,\"golf\":10,\"play\":10,\"sport\":8,\"water\":8,\"club\":8,\"ball\":7,\"swimming\":7,\"pool\":5,\"diving\":5},\"result_code\":\"200\",\"result_msg\":\"Success\"}">





def destroy
	
	intention = Intention.find(params[:id])
	if current_user.intentions.include? intention
    	intention.delete
	end
    	redirect_to '/'
end




def want_to
	if signed_in?
		@intention = Intention.find(params[:id])
		@intention.users << current_user
		redirect_to intention_path(@intention.id)
	else
		flash.now[:error]='Must be logged in'
		redirect_to '/'
	end

end





end
