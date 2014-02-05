class Match < ActiveRecord::Base
  belongs_to :word
  belongs_to :intention
end
