class Category < ActiveRecord::Base
	has_many :directives
	has_many :intentions, through: :directives
end
