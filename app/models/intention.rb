class Intention < ActiveRecord::Base

	has_many :goals
	has_many :users, through: :goals


end
