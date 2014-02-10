class Band < ActiveRecord::Base

	has_many :rockouts
	has_many :users, through: :rockouts

end
