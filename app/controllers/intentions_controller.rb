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

		desired_intention = Intention.find_by_name(:name)

			if desired_intention.blank?
			@intention = Intention.create(new_intention)
			@intention.users << User.find(current_user.id)
				
			
			elsif
				desired_intention.users << User.find(current_user.id)

			else
				redirect_to '/'

			end
		end



		response = Unirest::post "https://twinword-topic-tagging.p.mashape.com/generate/", 
	  headers: { 
	    "X-Mashape-Authorization" => "5C6dpbqx8WPB9mcS1VKusvceo7B5wT3t"
	  },
	  parameters: { 
	    "text" => @intention.name
	  }


	 

	  	response.body["topic"].each do |k,v|


  			returned_word = Word.create(name: k)

  			@intention.words << returned_word

	  	end

	  	all_intentions = []
	  	@intention.words.each	do |word|
	  		all_intentions << word.intentions 
	  	end
	  	

		redirect_to intention_path(@intention.id)

	end




	def show
		@intention = Intention.find(params[:id])














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
    redirect_to(root)
  end








end
