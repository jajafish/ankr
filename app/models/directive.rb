class Directive < ActiveRecord::Base
  belongs_to :intention
  belongs_to :category
end
