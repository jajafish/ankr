class Word < ActiveRecord::Base
	has_many :matches
	has_many :intentions, through: :matches
end
