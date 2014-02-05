class Intention < ActiveRecord::Base

	has_many :goals
	has_many :users, through: :goals

	has_many :matches
	has_many :words, through: :matches


end
